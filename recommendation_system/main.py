from DB_connection.database import Database
from enums.genre import Genre
from recommendation.review_dataset import ReviewDataset
from recommendation.strategy.dnn_module import DNNModule
from recommendation.strategy.recommendation_service import RecommendationService
from repository.genre_repository import GenreRepository
from repository.movie_repository import MovieRepository
from repository.review_repository import ReviewRepository


if __name__ == '__main__':
    db = Database(password="andrei")
    review_repo = ReviewRepository(db)
    movie_repo = MovieRepository(db)
    genre_repo = GenreRepository(db)

    recommendation_service = RecommendationService(DNNModule())
    recommended_movies_ids = recommendation_service.process_request(user_id=13, review_repo=review_repo, genre_repo=genre_repo, movie_repo=movie_repo)
    print(recommended_movies_ids)

