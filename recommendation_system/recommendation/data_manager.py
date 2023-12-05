import torch

from DB_connection.database import Database
from enums.genre import Genre
from repository.genre_repository import GenreRepository
from repository.review_repository import ReviewRepository


class DataManager:
    def __init__(self, review_repo: ReviewRepository, genre_repo: GenreRepository, user_id: int):
        self.review_repo = review_repo
        self.genre_repo = genre_repo
        self.user_id = user_id

    def create_dataset(self):
        review_dataset = []
        list_of_reviews = self.review_repo.find_by_user_id(self.user_id)
        print(list_of_reviews)
        for review in list_of_reviews:
            output_value = int(review[3]*2)
            movie_id = review[2]
            list_of_genres = self.genre_repo.find_by_movie_id(movie_id)
            feature = torch.zeros(20)
            output = torch.zeros(10)
            output[output_value-1] = 1
            for genre in list_of_genres:
                feature[getattr(Genre, genre[1]).value] = output_value/10
            review_dataset.append((feature, output))

        return review_dataset
