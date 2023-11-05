

class Review:
    def __init__(self, id: int, movie_id: id, user_id: id, movie_rating: int, cast_rating: int, genre_rating: int,
                 director_rating: int, script_rating: int):
        self._id = id
        self._movie_id = movie_id
        self._user_id = user_id
        self._movie_rating = movie_rating
        self._cast_rating = cast_rating
        self._genre_rating = genre_rating
        self._director_rating = director_rating
        self._script_rating = script_rating

    def get_movie_rating(self):
        return self._movie_rating

    def set_movie_rating(self, movie_rating: int):
        self._movie_rating = movie_rating

    def get_cast_rating(self):
        return self._cast_rating

    def set_cast_rating(self, cast_rating: int):
        self._cast_rating = cast_rating

    def get_genre_rating(self):
        return self._genre_rating

    def set_genre_rating(self, genre_rating: int):
        self._genre_rating = genre_rating

    def get_director_rating(self):
        return self._director_rating

    def set_director_rating(self, director_rating: int):
        self._director_rating = director_rating

    def get_script_rating(self):
        return self._script_rating

    def set_script_rating(self, script_rating: int):
        self._script_rating = script_rating
