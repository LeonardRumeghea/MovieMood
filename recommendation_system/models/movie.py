from datetime import datetime

from models.director import Director


class Movie:
    def __init__(self, title: str, release_date: datetime, director: Director, cast: list, genres: list, rating: float):
        self._title = title
        self._release_date = release_date
        self._director = director
        self._cast = cast
        self._genres = genres
        self._rating = rating

    def get_title(self):
        return self._title

    def set_title(self, title: str):
        self._title = title

    def get_release_date(self):
        return self._release_date

    def set_release_date(self, release_date: datetime):
        self._release_date = release_date

    def get_director(self):
        return self._director

    def set_director(self, director: Director):
        self._director = director

    def get_cast(self):
        return self._cast

    def set_cast(self, cast: list):
        self._cast = cast

    def get_genres(self):
        return self._genres

    def set_genres(self, genres: list):
        self._genres = genres

    def get_rating(self):
        return self._rating

    def set_rating(self, rating: float):
        self._rating = rating
