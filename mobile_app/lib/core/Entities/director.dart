import 'package:mobile_app/core/Entities/genre.dart';
import 'package:mobile_app/core/Entities/movie.dart';
import 'package:mobile_app/core/Entities/person.dart';

class Director extends Person {
  List<Movie> filmography;
  List<Genre> style;

  Director(
      {required firstName,
      required lastName,
      required dateOfBirth,
      required biography,
      required nationality,
      required this.filmography,
      required this.style})
      : super(firstName, lastName, dateOfBirth, biography, nationality);

  List<Movie> getFilmography() => filmography;
  List<Genre> getStyle() => style;

  factory Director.fromJSON(Map<String, dynamic> json) {
    Iterable f = json['filmography'].decode(json['filmography']);
    return Director(
        firstName: json['firstName'],
        lastName: json['lastName'],
        dateOfBirth: json['dateOfBirth'],
        biography: json['biography'],
        nationality: json['nationality'],
        filmography: List<Movie>.from(f.map((film) => Movie.fromJson(film))),
        style: genresFromJSONList(json['style']));
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'biography': biography,
        'nationality': nationality,
        'filmography': filmography.map((f) => f.toJson()).toList(),
        'style': style.map((s) => genreToString(s)).toList()
      };
}
