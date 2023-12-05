from DB_connection.database import Database
from models.movie import Movie
from repository.repository import Repository


class MovieRepository(Repository[Movie]):
    def __init__(self, db: Database):
        self.database = db

    def find_by_id(self, id: int) -> list:
        sql = self.database.cursor.mogrify("SELECT * FROM movies WHERE movieid={0}".format(id))
        self.database.cursor.execute(sql)
        return self.database.cursor.fetchall()

    def find_by_interval_of_ids(self, id_min: int, id_max: int) -> list:
        sql = self.database.cursor.mogrify("SELECT * FROM movies WHERE movieid>={0} AND movieid<={1} ".format(id_min, id_max))
        self.database.cursor.execute(sql)
        return self.database.cursor.fetchall()


