import 'dart:ffi';

import 'package:mobile_app/core/Entities/actor.dart';
import 'package:mobile_app/core/Entities/director.dart';
import 'package:mobile_app/core/Entities/genre.dart';

class Movie {
  final String title;
  final String releaseDate;
  final Director director;
  final List<Actor> actors;
  final List<Genre> genres;
  final Double rating;

  Movie(
      {required this.title,
      required this.releaseDate,
      required this.director,
      required this.actors,
      required this.genres,
      required this.rating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    Iterable a = json['actors'].decode(json['actors']);
    Iterable g = json['genres'].decode(json['genres']);
    return Movie(
        title: json['title'],
        releaseDate: json['releaseDate'],
        director: Director.fromJSON(json['director']),
        actors: List<Actor>.from(a.map((actor) => Actor.fromJson(actor))),
        genres: List<Genre>.from(g.map((genre) => genreFromString(genre))),
        rating: json['rating']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'releaseDate': releaseDate,
        'director': director.toJson(),
        'actors': actors.map((a) => a.toJson()).toList(),
        'genres': genres.map((g) => genreToString(g)).toList(),
        'rating': rating
      };
}
