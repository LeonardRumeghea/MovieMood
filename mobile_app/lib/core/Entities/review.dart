import 'package:mobile_app/core/Entities/movie.dart';
import 'package:mobile_app/core/Entities/user.dart';

class Review {
  final Movie movie;
  final User user;
  final int movieRating;
  final String castRating;
  final String directorRating;
  final String genreRating;
  final String sciptRating;
  final String reviewText;

  Review(
      {required this.movie,
      required this.user,
      required this.movieRating,
      required this.castRating,
      required this.directorRating,
      required this.genreRating,
      required this.sciptRating,
      required this.reviewText});

  Movie getMovie() => movie;
  User getUser() => user;
  int getMovieRating() => movieRating;
  String getCastRating() => castRating;
  String getDirectorRating() => directorRating;
  String getGenreRating() => genreRating;
  String getScriptRating() => sciptRating;
  String getReviewText() => reviewText;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        movie: Movie.fromJson(json['movie']),
        user: User.fromJson(json['user']),
        movieRating: json['movieRating'],
        castRating: json['castRating'],
        directorRating: json['directorRating'],
        genreRating: json['genreRating'],
        sciptRating: json['scriptRating'],
        reviewText: json['reviewText']);
  }

  Map<String, dynamic> toJson() => {
        'movie': movie.toJson(),
        'user': user.toJson(),
        'movieRating': movieRating,
        'castRating': castRating,
        'directorRating': directorRating,
        'genreRating': genreRating,
        'scriptRating': sciptRating,
        'reviewText': reviewText
      };
}
