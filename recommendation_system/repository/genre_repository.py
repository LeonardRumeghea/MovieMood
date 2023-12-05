from DB_connection.database import Database
from enums.genre import Genre
from repository.repository import Repository


class GenreRepository(Repository[Genre]):
    def __init__(self, db: Database):
        self.database = db

    def find_by_movie_id(self, movie_id: int) -> list:
        sql = self.database.cursor.mogrify("SELECT * FROM genres_movies WHERE movieid={0}".format(movie_id))
        self.database.cursor.execute(sql)
        return self.database.cursor.fetchall()
