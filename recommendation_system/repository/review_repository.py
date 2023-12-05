from DB_connection.database import Database
from models.review import Review
from repository.repository import Repository


class ReviewRepository(Repository[Review]):
    def __init__(self, db: Database):
        self.database = db

    def find_by_movie_id(self, movie_id: int) -> list:
        sql = self.database.cursor.mogrify("SELECT * FROM ratings WHERE movieid={0}".format(movie_id))
        self.database.cursor.execute(sql)
        return self.database.cursor.fetchall()

    def find_by_user_id(self, user_id: int) -> list:
        sql = self.database.cursor.mogrify("SELECT * FROM ratings WHERE userid={0}".format(user_id))
        self.database.cursor.execute(sql)
        return self.database.cursor.fetchall()

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
