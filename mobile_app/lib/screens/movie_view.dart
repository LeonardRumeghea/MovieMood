import 'package:flutter/material.dart';
import 'package:mobile_app/core/Entities/genre.dart';
import 'package:mobile_app/core/Entities/movie.dart';
import 'package:mobile_app/core/Entities/review.dart';
import 'package:mobile_app/core/constants.dart';
import 'package:mobile_app/screens/rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class MovieView extends StatefulWidget {
  final Movie movie;
  const MovieView({super.key, required this.movie});

  @override
  State<MovieView> createState() => _MovieViewState();
}

bool isFavorite = false;
String movieUrl = "https://www.imdb.com/title/tt1517268/";
Review? yourReview;

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Image image = Image.network(
      "https://image.tmdb.org/t/p/original/u5kboZR4OMi4QdbOhawCZuzMVWJ.jpg",
      height: screenSize.height * 0.4,
      width: screenSize.width * 0.8,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Movie Details"),
          backgroundColor: accentColor,
        ),
        body: _getInfoPanel(screenSize, image, movieUrl));
  }

  _getInfoPanel(Size screenSize, Image image, String url) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _getMoviePoster(screenSize, image),
          _getButtons(screenSize, url),
          _getMovieInfoPanel(screenSize),
        ],
      ),
    );
  }

  _getMoviePoster(Size screenSize, Image image) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.05,
        left: screenSize.width * 0.1,
        right: screenSize.width * 0.1,
      ),
      child: Container(
        height: screenSize.height * 0.6,
        width: screenSize.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 10),
          ],
          image: DecorationImage(image: image.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  _getFavoriteButton(Size screenSize) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: isFavorite
          ? const Icon(Icons.favorite, color: Colors.red)
          : const Icon(Icons.favorite_border, color: Colors.white),
      color: Colors.white,
      iconSize: 32,
    );
  }

  _getPlayButton(Size screenSize, String url) {
    return IconButton(
      onPressed: () {
        _launchMovie("url");
      },
      icon: const Icon(Icons.play_circle_fill, color: Colors.white),
      color: Colors.white,
      iconSize: 32,
    );
  }

  _getAddToListButton(Size screenSize) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.add, color: Colors.white),
      color: Colors.white,
      iconSize: 32,
    );
  }

  _getButtons(Size screenSize, String movieUrl) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getPlayButton(screenSize, movieUrl),
          Row(
            children: [
              _getAddToListButton(screenSize),
              _getFavoriteButton(screenSize),
            ],
          ),
        ],
      ),
    );
  }

  _getMovieInfoPanel(Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.05,
        vertical: screenSize.height * 0.025,
      ),
      child: SizedBox(
        // height: screenSize.height * 0.8,
        width: screenSize.width * 0.9,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 10, spreadRadius: 10),
            ],
            color: Colors.grey.shade800,
          ),
          child: _getMovieInfos(screenSize),
        ),
      ),
    );
  }

  _getMovieInfos(Size screenSize) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.movie.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "${widget.movie.rating}/10",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Icon(Icons.star, color: Colors.yellow),
                ],
              ),
              Text(
                DateFormat.yMMMd().format(widget.movie.releaseDate),
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: _getGenresRow(screenSize)),
            ),
          ),
          Divider(color: Colors.grey.shade600),
          _getDescription(screenSize),
          Divider(color: Colors.grey.shade600),
          _getReviewSection(screenSize),
        ],
      ),
    );
  }

  List<Widget> _getGenresRow(Size screenSize) => widget.movie.genres
      .map((g) => _getGenreLabel(screenSize, genreToString(g)))
      .toList();

  Widget _getGenreLabel(Size screenSize, String genre) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.01,
          vertical: screenSize.height * 0.01),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade600,
          border: Border.all(color: Colors.grey.shade900),
        ),
        child: Text(genre, style: const TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget _getDescription(Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.025),
      child: Text(
        "     ${widget.movie.description}",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _getReviewSection(Size screenSize) {
    return yourReview == null
        ? _getNoReviewSection(screenSize)
        : _getReview(screenSize);
  }

  Widget _getNoReviewSection(Size screenSize) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.025),
        child: TextButton(
            onPressed: _showAddReviewDialog,
            child: Text("Review this movie",
                style: TextStyle(
                  fontSize: 20,
                  color: accentColor,
                ))),
      ),
    );
  }

  late double rating = 0.0;

  Future _showAddReviewDialog() async {
    showDialog(context: context, builder: (_) => const RatingDialog());
  }

  Widget _getReview(Size screenSize) {
    return const SizedBox();
  }

  Future<void> _launchMovie(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
      // ignore: use_build_context_synchronously
      // showDialog(
      //   context: context,
      //   builder: (context) => const AlertDialog(
      //     title: Text("Error"),
      //     content: Text("Could not launch movie. Please try again later."),
      //   ),
      // );
    }
  }
}
