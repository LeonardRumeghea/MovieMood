from enums.genre import Genre


def verify_genre(genre):
    try:
        id = getattr(Genre, genre[1]).value
        return True
    except AttributeError:
        return False


def data_monitor(function):
    def wrapper(*args, **kwargs):
        assert len(args[1][1]) <= 20
        assert len(args[1][1]) > 0
        genre_list = []
        # Verifying the correctness of the genres and update the list only with the available ones
        for genre in args[1][1]:
            if verify_genre(genre):
                genre_list.append(genre)
        # Verify and modify (if needed) the grade of the movie from the database
        while args[1][0] > 10:
            args[1][0] /= 10
        output = function(args[0], (args[1][0], genre_list), **kwargs)
        return output
    return wrapper


def movie_monitor(function):
    def wrapper(*args, **kwargs):
        seen_movies = args[3].find_by_user_id(args[4])
        final_list = []
        for recommended_movie in args[1]:
            seen = False
            for movie in seen_movies:
                if movie[2] == recommended_movie:
                    seen = True
                    break
            if not seen:
                final_list.append(recommended_movie)
        output = function(args[0], final_list, args[2], args[3], args[4], **kwargs)
        return output
    return wrapper

