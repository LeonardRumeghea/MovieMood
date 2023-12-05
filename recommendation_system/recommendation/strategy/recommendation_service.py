from recommendation.strategy.recommendation_strategy import RecommendationStrategy
from repository.genre_repository import GenreRepository
from repository.movie_repository import MovieRepository
from repository.review_repository import ReviewRepository


class RecommendationService:
    def __init__(self, strategy: RecommendationStrategy):
        self._strategy = strategy

    def process_request(self, user_id: int, review_repo: ReviewRepository, genre_repo: GenreRepository, movie_repo: MovieRepository):
        return self._strategy.create_recommendation(user_id, review_repo, genre_repo, movie_repo)
