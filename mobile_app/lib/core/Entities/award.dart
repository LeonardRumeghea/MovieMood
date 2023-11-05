import 'package:mobile_app/core/Entities/genre.dart';

class Award {
  final String title;
  final DateTime date;
  final Genre category;
  final String description;

  Award(
      {required this.title,
      required this.date,
      required this.category,
      required this.description});

  String getTitle() => title;
  DateTime getDate() => date;
  Genre getCategory() => category;
  String getDescription() => description;

  factory Award.fromJson(Map<String, dynamic> json) {
    return Award(
        title: json['title'],
        date: json['date'],
        category: genreFromString(json['category']),
        description: json['description']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'category': genreToString(category),
        'description': description
      };
}
