from recommendation_strategy import RecommendationStrategy


class ColabFilterModule(RecommendationStrategy):
    def __init__(self, movies: list, users: list):
        self._movies = movies
        self._users = users

    def create_recommendation(self):
        pass

    def get_users(self):
        return self._users

    def set_users(self, users: list):
        self._users = users

    def get_movies(self):
        return self._movies

    def set_movies(self, movies: list):
        self._movies = movies

