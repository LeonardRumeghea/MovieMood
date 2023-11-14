from recommendation import recommendation_mlp
from recommendation.pipeline import Pipeline
from recommendation.recommendation_mlp import RecommendationMLP
from recommendation_strategy import RecommendationStrategy


class DNNModule(RecommendationStrategy):
    def __init__(self, model: RecommendationMLP, movies: list):
        self._model = model
        self._configurations = self.create_configuration(75, 10, 50, 10, 30, 20, 0.007, 0.86, 0.0, "SGD")
        self._pipeline = Pipeline(self._model, self._configurations)
        self._movies = movies

    def create_configuration(self, epochs: int, classes: int, batch_size_test: int, input_dim: int,
                             hidden_layer1_dim: int, hidden_layer2_dim: int,
                             learning_rate: float, momentum: float, decay: float, optimizer: str):
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
        return configurations

    def start_pipeline(self):
        self._pipeline.start()

    def create_recommendation(self):
        pass

    def set_movies(self, movies: list):
        self._movies = movies

    def get_movies(self):
        return self._movies

    def set_model(self, model: recommendation_mlp):
        self._model = model

    def get_model(self):
        return self._model
