from recommendation.mop.mop import movie_monitor
from recommendation.strategy.recommendation_strategy import RecommendationStrategy
from repository.genre_repository import GenreRepository
from repository.movie_repository import MovieRepository
from repository.review_repository import ReviewRepository


class RecommendationService:
    def __init__(self, strategy: RecommendationStrategy):
        self._strategy = strategy

    @movie_monitor
    def return_recommendation(self, recommendations_ids: list, movie_repo: MovieRepository, review_repo: ReviewRepository, user_id: int):
        list_movies_name = []
        for movie_id in recommendations_ids:
            movie = movie_repo.find_by_id(movie_id)
            list_movies_name.append(movie[0][1])
        return list_movies_name

    def process_request(self, user_id: int, review_repo: ReviewRepository, genre_repo: GenreRepository, movie_repo: MovieRepository):
        #return self._strategy.create_recommendation(user_id, review_repo, genre_repo, movie_repo)
        recommendation_ids = self._strategy.create_recommendation(user_id, review_repo, genre_repo, movie_repo)
        return self.return_recommendation(recommendation_ids, movie_repo, review_repo, user_id)
