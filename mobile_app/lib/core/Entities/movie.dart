import 'package:mobile_app/core/Entities/actor.dart';
import 'package:mobile_app/core/Entities/director.dart';
import 'package:mobile_app/core/Entities/genre.dart';

class Movie {
  final String title;
  final String releaseDate;
  final String description;
  final Director director;
  final List<Actor> cast;
  final List<Genre> genres;
  final double rating;

  Movie(
      {required this.title,
      required this.releaseDate,
      required this.description,
      required this.director,
      required this.cast,
      required this.genres,
      required this.rating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    Iterable a = json['actors'].decode(json['actors']);
    Iterable g = json['genres'].decode(json['genres']);
    return Movie(
        title: json['title'],
        releaseDate: json['releaseDate'],
        description: json['description'],
        director: Director.fromJSON(json['director']),
        cast: List<Actor>.from(a.map((actor) => Actor.fromJson(actor))),
        genres: List<Genre>.from(g.map((genre) => genreFromString(genre))),
        rating: json['rating']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'releaseDate': releaseDate,
        'description': description,
        'director': director.toJson(),
        'actors': cast.map((a) => a.toJson()).toList(),
        'genres': genres.map((g) => genreToString(g)).toList(),
        'rating': rating
      };
}
