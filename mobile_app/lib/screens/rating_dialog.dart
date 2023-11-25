import 'package:awesome_rating/awesome_rating.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/constants.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int movieRating = 0;
  int castRating = 0;
  int directorRating = 0;
  int genreRating = 0;
  int sciptRating = 0;
  String reviewText = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return AlertDialog(
      title: Center(
        child: Text(
          'Rate movie',
          style: TextStyle(color: accentColor, fontSize: 22),
        ),
      ),
      content: SizedBox(
        height: screenSize.height * 0.5,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getMovieRating(screenSize),
              _getCastRating(screenSize),
              _getDirectorRating(screenSize),
              _getGenreRating(screenSize),
              _getScriptRating(screenSize),
              _getDescription(screenSize),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: accentColor?.withOpacity(0.75),
              fontSize: 18,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Submit',
              style: TextStyle(
                color: accentColor,
                fontSize: 18,
              )),
        ),
      ],
    );
  }

  _getMovieRating(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Movie Rating', style: TextStyle(fontSize: 20)),
          AwesomeStarRating(
            onRatingChanged: (value) =>
                setState(() => movieRating = value.toInt()),
            starCount: 5,
            rating: movieRating.toDouble(),
            size: 40,
            color: Colors.yellow,
            borderColor: Colors.grey,
            allowHalfRating: true,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
          ),
          Divider(color: Colors.grey.shade600, thickness: 1),
        ],
      ),
    );
  }

  _getCastRating(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cast Rating', style: TextStyle(fontSize: 20)),
          AwesomeStarRating(
            onRatingChanged: (value) =>
                setState(() => castRating = value.toInt()),
            starCount: 5,
            rating: castRating.toDouble(),
            size: 40,
            color: Colors.yellow,
            borderColor: Colors.grey,
            allowHalfRating: true,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
          ),
          Divider(color: Colors.grey.shade600, thickness: 1),
        ],
      ),
    );
  }

  _getDirectorRating(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Director Rating', style: TextStyle(fontSize: 20)),
          AwesomeStarRating(
            onRatingChanged: (value) =>
                setState(() => directorRating = value.toInt()),
            starCount: 5,
            rating: directorRating.toDouble(),
            size: 40,
            color: Colors.yellow,
            borderColor: Colors.grey,
            allowHalfRating: true,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
          ),
          Divider(color: Colors.grey.shade600, thickness: 1),
        ],
      ),
    );
  }

  _getGenreRating(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Genre Rating', style: TextStyle(fontSize: 20)),
          AwesomeStarRating(
            onRatingChanged: (value) =>
                setState(() => genreRating = value.toInt()),
            starCount: 5,
            rating: genreRating.toDouble(),
            size: 40,
            color: Colors.yellow,
            borderColor: Colors.grey,
            allowHalfRating: true,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
          ),
          Divider(color: Colors.grey.shade600, thickness: 1),
        ],
      ),
    );
  }

  _getScriptRating(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Script Rating', style: TextStyle(fontSize: 20)),
          AwesomeStarRating(
            onRatingChanged: (value) =>
                setState(() => sciptRating = value.toInt()),
            starCount: 5,
            rating: sciptRating.toDouble(),
            size: 40,
            color: Colors.yellow,
            borderColor: Colors.grey,
            allowHalfRating: true,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
          ),
          Divider(color: Colors.grey.shade600, thickness: 1),
        ],
      ),
    );
  }

  _getDescription(Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Review', style: TextStyle(fontSize: 20)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
            child: TextField(
              maxLines: 5,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your review here',
              ),
              onChanged: (text) => setState(() => reviewText = text),
            ),
          ),
        ],
      ),
    );
  }
}
