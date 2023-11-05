import 'package:mobile_app/core/Entities/award.dart';
import 'package:mobile_app/core/Entities/movie.dart';
import 'package:mobile_app/core/Entities/person.dart';

class Actor extends Person {
  List<Movie> filmography;
  List<Award> awards;

  Actor(
      {required firstName,
      required lastName,
      required dateOfBirth,
      required biography,
      required nationality,
      required this.filmography,
      required this.awards})
      : super(firstName, lastName, dateOfBirth, biography, nationality);

  List<Movie> getFilmography() => filmography;
  List<Award> getAwards() => awards;

  factory Actor.fromJson(Map<String, dynamic> json) {
    Iterable f = json['filmography'].decode(json['filmography']);
    Iterable a = json['awards'].decode(json['awards']);
    return Actor(
        firstName: json['firstName'],
        lastName: json['lastName'],
        dateOfBirth: json['dateOfBirth'],
        biography: json['biography'],
        nationality: json['nationality'],
        filmography: List<Movie>.from(f.map((film) => Movie.fromJson(film))),
        awards: List<Award>.from(a.map((award) => Award.fromJson(award))));
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth.toString(),
        'biography': biography,
        'nationality': nationality,
        'filmography': filmography.map((f) => f.toJson()).toList(),
        'awards': awards.map((a) => a.toJson()).toList()
      };
}
