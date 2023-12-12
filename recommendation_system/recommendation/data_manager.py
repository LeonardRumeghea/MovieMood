import torch

from DB_connection.database import Database
from enums.genre import Genre
from recommendation.mop.mop import data_monitor
from repository.genre_repository import GenreRepository
from repository.review_repository import ReviewRepository


class DataManager:
    def __init__(self, review_repo: ReviewRepository, genre_repo: GenreRepository, user_id: int):
        self.review_repo = review_repo
        self.genre_repo = genre_repo
        self.user_id = user_id

    @data_monitor
    def singular_input(self, review):
        feature = torch.zeros(20)
        output = torch.zeros(10)
        output[review[0] - 1] = 1
        for genre in review[1]:
            feature[getattr(Genre, genre[1]).value] = review[0] / 10
        return feature, output

    def create_dataset(self):
        review_dataset = []
        list_of_reviews = self.review_repo.find_by_user_id(self.user_id)
        for review in list_of_reviews:
            output_value = int(review[3] * 2)
            movie_id = review[2]
            list_of_genres = self.genre_repo.find_by_movie_id(movie_id)
            review_dataset.append(self.singular_input((output_value, list_of_genres)))

        return review_dataset
