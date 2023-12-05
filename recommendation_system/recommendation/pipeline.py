from recommendation import recommendation_mlp
import torch
from torch.utils.data import DataLoader
from tqdm import tqdm

from recommendation.recommendation_mlp import RecommendationMLP
from recommendation.review_dataset import ReviewDataset
from repository.genre_repository import GenreRepository
from repository.review_repository import ReviewRepository


class Pipeline:
    def __init__(self, config: dict):
        self.config = config

    @staticmethod
    def get_default_device():
        if torch.cuda.is_available():
            return torch.device('cuda')
        if torch.backends.mps.is_available():
            return torch.device('mos')
        return torch.device('cpu')

    @staticmethod
    def save_trained_model(model, path):
        torch.save(model.state_dict(), path)

    def create_components(self, device, user_id: int, review_repo: ReviewRepository, genre_repo: GenreRepository):
        total_dataset = ReviewDataset(review_repo, genre_repo, user_id)

        pin_memory = device.type == 'cuda'
        num_workers = 2
        persistent_workers = (num_workers != 0)
        criterion = torch.nn.CrossEntropyLoss()

        train_loader = DataLoader(total_dataset, shuffle=True, pin_memory=pin_memory, num_workers=num_workers,
                                  batch_size=self.config["batch_size_test"], drop_last=True,
                                  persistent_workers=persistent_workers)

        model = RecommendationMLP(self.config["input_dim"], self.config["hidden_layer1_dim"], self.config["hidden_layer2_dim"], self.config["classes"])
        model = model.to(device)
        if self.config["optimizer"] == "RMSProp":
            optimizer = torch.optim.RMSprop(model.parameters(), self.config["learning_rate"], weight_decay=self.config["decay"],
                                            momentum=self.config["momentum"])
        elif self.config["optimizer"] == "Adam":
            optimizer = torch.optim.Adam(model.parameters(), self.config["learning_rate"], weight_decay=self.config["decay"])
        elif self.config["optimizer"] == "SGD":
            optimizer = torch.optim.SGD(model.parameters(), self.config["learning_rate"], weight_decay=self.config["decay"],
                                        momentum=self.config["momentum"])
        elif self.config["optimizer"] == "AdaGrad":
            optimizer = torch.optim.Adagrad(model.parameters(), self.config["learning_rate"], weight_decay=self.config["decay"])
        else:
            optimizer = torch.optim.SGD(model.parameters(), self.config["learning_rate"])

        return model, train_loader, criterion, optimizer

    def accuracy(self, output, labels):
        fp_plus_fn = torch.logical_not(output == labels).sum().item()
        all_elements = len(output)
        return (all_elements - fp_plus_fn) / all_elements

    def train(self, model, train_loader, criterion, optimizer, device):
        model.train()
        all_outputs = []
        all_labels = []
        loss_per_epoch = 0
        for data, labels in train_loader:
            data = data.to(device, non_blocking=True)
            labels = labels.to(device, non_blocking=True)

            output = model(data)
            loss = criterion(output, labels)
            loss_per_epoch += loss.item()
            loss.backward()
            optimizer.step()
            optimizer.zero_grad(set_to_none=True)

            output = output.softmax(dim=1).detach().cpu().squeeze()
            labels = labels.cpu().squeeze()
            all_outputs.append(output)
            all_labels.append(labels)

        all_outputs = torch.cat(all_outputs).argmax(dim=1)
        all_labels = torch.cat(all_labels).argmax(dim=1)

        return round(self.accuracy(all_outputs, all_labels), 4), loss_per_epoch/len(train_loader)

    def do_epoch(self, model, train_loader, criterion, optimizer, device):
        acc, loss = self.train(model, train_loader, criterion, optimizer, device)
        return acc, loss

    def start(self, user_id: int, review_repo: ReviewRepository, genre_repo: GenreRepository, device=get_default_device()):
        model, train_loader, criterion, optimizer = self.create_components(device, user_id, review_repo, genre_repo)

        tbar = tqdm(tuple(range(self.config["epochs"])))
        for epoch in tbar:
            accuracy, loss = self.do_epoch(model, train_loader, criterion, optimizer, device)
            tbar.set_postfix_str(f"Acc: {accuracy} Loss: {loss}")

        self.save_trained_model(model, self.config["path"]+"_user{0}.pt".format(user_id))
        return model
