import recommendation_mlp
from recommendation_strategy import RecommendationStrategy


class DNNModule(RecommendationStrategy):
    def __init__(self, model: recommendation_mlp, movies: list):
        self._model = model
        self._movies = movies

    def create_pipeline(self):
        pass

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
