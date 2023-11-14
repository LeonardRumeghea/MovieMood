from models.movie import Movie
from models.review import Review
from models.user import User
from repository.repository import Repository


class ReviewRepository(Repository[Review]):
    def find_by_movie(self, movie: Movie) -> list:
        pass

    def find_by_user(self, user: User) -> list:
        pass

    def find_by_movie_rating(self, rating: int) -> list:
        pass

    def find_by_csat_rating(self, rating: int) -> list:
        pass

    def find_by_genre_rating(self, rating: int) -> list:
        pass

    def find_by_director_rating(self, rating: int) -> list:
        pass

    def find_by_script_rating(self, rating: int) -> list:
        pass
