from torch.utils.data import TensorDataset, DataLoader

from enums.genre import Genre
from recommendation.pipeline import Pipeline
from recommendation.recommendation_mlp import RecommendationMLP
from recommendation.strategy.recommendation_strategy import RecommendationStrategy
from repository.genre_repository import GenreRepository
from repository.movie_repository import MovieRepository
from repository.review_repository import ReviewRepository
import os.path
import torch


class DNNModule(RecommendationStrategy):
    def __init__(self):
        self._configurations = self.create_configuration(400, 10, 10, 20, 30, 20, 0.005, 0.86, 0.0, "Adam",
                                                         "trainedModels/Adam_400epochs_0.005lr")
        self._pipeline = Pipeline(self._configurations)

    def create_configuration(self, epochs: int, classes: int, batch_size_test: int, input_dim: int,
                             hidden_layer1_dim: int, hidden_layer2_dim: int,
                             learning_rate: float, momentum: float, decay: float, optimizer: str, path: str):
        configurations = dict()
        configurations["epochs"] = epochs
        configurations["classes"] = classes
        configurations["batch_size_test"] = batch_size_test
        configurations["input_dim"] = input_dim
        configurations["hidden_layer1_dim"] = hidden_layer1_dim
        configurations["hidden_layer2_dim"] = hidden_layer2_dim
        configurations["learning_rate"] = learning_rate
        configurations["momentum"] = momentum
        configurations["decay"] = decay
        configurations["optimizer"] = optimizer
        configurations["path"] = path
        return configurations

    def load_model(self, path):
        state_dict = torch.load(path)
        model = RecommendationMLP(self._configurations["input_dim"], self._configurations["hidden_layer1_dim"],
                                  self._configurations["hidden_layer2_dim"], self._configurations["classes"])
        model.load_state_dict(state_dict)
        return model

    def start_pipeline(self, user_id: int, review_repo: ReviewRepository, genre_repo: GenreRepository):
        return self._pipeline.start(user_id, review_repo, genre_repo)

    def prepare_prediction_features(self, review_repo: ReviewRepository, genre_repo: GenreRepository,
                                    movie_repo: MovieRepository, first_id: int, last_id: int):
        list_of_movies = movie_repo.find_by_interval_of_ids(first_id, last_id)
        features = []
        for movie in list_of_movies:
            movie_id = movie[0]
            list_of_genres = genre_repo.find_by_movie_id(movie_id)
            list_of_reviews = review_repo.find_by_movie_id(movie_id)
            sum_rating = 0
            for review in list_of_reviews:
                sum_rating += review[3]
            sum_rating = int(sum_rating * 2 / len(list_of_reviews))
            feature = torch.zeros(20)
            for genre in list_of_genres:
                feature[getattr(Genre, genre[1]).value] = sum_rating / 10
            features.append(feature)
        return features

    def predict_recommendation(self, model, review_repo: ReviewRepository, genre_repo: GenreRepository,
                               movie_repo: MovieRepository):
        first_id = 110
        last_id = 150

        features = self.prepare_prediction_features(review_repo, genre_repo, movie_repo, first_id, last_id)
        features = torch.stack(features)
        features_dataset = TensorDataset(features)
        model.eval()
        dataloader = DataLoader(features_dataset, shuffle=False, batch_size=100)
        all_outputs = []
        for movies in dataloader:
            output = model(movies[0])
            output = output.softmax(dim=1).detach().cpu().squeeze()
            all_outputs.append(output)
        all_outputs = torch.cat(all_outputs).argmax(dim=1)

        recommended_movies_ids = []
        for index, elem in enumerate(all_outputs):
            if elem >= 6:
                recommended_movies_ids.append(index + first_id)
        return recommended_movies_ids

    def create_recommendation(self, user_id: int, review_repo: ReviewRepository, genre_repo: GenreRepository,
                              movie_repo: MovieRepository):
        if not os.path.isfile(self._configurations["path"] + "_user{0}.pt".format(user_id)):
            model = self.start_pipeline(user_id, review_repo, genre_repo)
        else:
            model = self.load_model(self._configurations["path"] + "_user{0}.pt".format(user_id))
        recommended_movies_ids = self.predict_recommendation(model, review_repo, genre_repo, movie_repo)
        return recommended_movies_ids
