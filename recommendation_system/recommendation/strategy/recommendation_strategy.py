from abc import ABC, abstractmethod

from repository.genre_repository import GenreRepository
from repository.movie_repository import MovieRepository
from repository.review_repository import ReviewRepository


class RecommendationStrategy(ABC):
    @abstractmethod
    def create_recommendation(self, user_id: int, review_repo: ReviewRepository, genre_repo: GenreRepository, movie_repo: MovieRepository):
        pass
