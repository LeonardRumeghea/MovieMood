from recommendation import recommendation_mlp
import torch
from torch.utils.data import DataLoader
from tqdm import tqdm

from recommendation.recommendation_mlp import RecommendationMLP
from recommendation.review_dataset import ReviewDataset


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

    def create_components(self, device):
        total_dataset = ReviewDataset()

        pin_memory = device.type == 'cuda'
        num_workers = 2
        persistent_workers = (num_workers != 0)
        criterion = torch.nn.CrossEntropyLoss()

        train_loader = DataLoader(total_dataset, shuffle=True, pin_memory=pin_memory, num_workers=num_workers,
                                  batch_size=self.config["batch_size_test"], drop_last=False,
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
        for data, labels in train_loader:
            data = data.to(device, non_blocking=True)
            labels = labels.to(device, non_blocking=True)

            output = model(data)
            loss = criterion(output, labels)
            loss.backward()
            optimizer.step()
            optimizer.zero_grad(set_to_none=True)

            output = output.softmax(dim=1).detach().cpu().squeeze()
            labels = labels.cpu().squeeze()
            all_outputs.append(output)
            all_labels.append(labels)

        all_outputs = torch.cat(all_outputs).argmax(dim=1)
        all_labels = torch.cat(all_labels)

        return round(self.accuracy(all_outputs, all_labels), 4)

    def do_epoch(self, model, train_loader, criterion, optimizer, device):
        acc = self.train(model, train_loader, criterion, optimizer, device)
        return acc

    def start(self, device=get_default_device()):
        model, train_loader, criterion, optimizer = self.create_components(device)
        # for features, labels in train_loader:
        #     print(features, labels)
        tbar = tqdm(tuple(range(self.config["epochs"])))
        for epoch in tbar:
            accuracy = self.do_epoch(model, train_loader, criterion, optimizer, device)
            tbar.set_postfix_str(f"Acc: {accuracy}")
