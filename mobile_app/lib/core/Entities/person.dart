// import 'package:flutter/material.dart';

abstract class Person {
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String biography;
  final String nationality;
  // final Image profilePicture;

  Person(this.firstName, this.lastName, this.dateOfBirth, this.biography,
      this.nationality);
  // required this.profilePicture,

  String getFirstName() => firstName;
  String getLastName() => lastName;
  String getDateOfBirth() => dateOfBirth;
  String getBiography() => biography;
  String getNationality() => nationality;
}
