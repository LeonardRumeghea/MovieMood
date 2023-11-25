import 'package:flutter/material.dart';
import 'package:mobile_app/core/Entities/genre.dart';
import 'package:mobile_app/core/Entities/movie.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieView extends StatefulWidget {
  final Movie movie;
  const MovieView({super.key, required this.movie});

  @override
  State<MovieView> createState() => _MovieViewState();
}

bool isFavorite = false;

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
        title: Text(widget.movie.title),
      ),
      body: Stack(
        children: [
          Positioned(
            top: screenSize.width * 0.1,
            left: screenSize.width * 0.1,
            child: Container(
              height: screenSize.height * 0.4,
              width: screenSize.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26, blurRadius: 10, spreadRadius: 10),
                ],
                image: DecorationImage(
                  image: image.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.39,
            left: screenSize.width * 0.78,
            child: IconButton(
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
            ),
          ),
          Positioned(
            top: screenSize.height * 0.39,
            left: screenSize.width * 0.11,
            child: IconButton(
              onPressed: () {
                _launchMovie("https://www.imdb.com/title/tt1517268/");
              },
              icon: const Icon(Icons.play_circle_fill, color: Colors.white),
              color: Colors.white,
              iconSize: 32,
            ),
          ),
          Positioned(
              top: screenSize.height * 0.475,
              left: screenSize.width * 0.025,
              child: _getInfoPanel(screenSize)),
        ],
      ),
    );
  }

  _getInfoPanel(Size screenSize) {
    return Container(
        width: screenSize.width * 0.95,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(20),
        ),
        child: _getMovieInfos(screenSize));
  }

  _getMoviePoster(Size screenSize) {}

  _getMovieInfos(Size screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.movie.title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        const Divider(thickness: 1),
        Text(
          "Release date: ${widget.movie.releaseDate}",
          style: const TextStyle(
            fontSize: 22,
            fontFamily: 'Roboto',
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        Text(
          "Director: ${widget.movie.director.firstName} ${widget.movie.director.lastName}",
          style: const TextStyle(
            fontSize: 22,
            fontFamily: 'Roboto',
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        Text(
          "Genres: ${widget.movie.genres.map((e) => genreToString(e)).join(", ")}",
          style: const TextStyle(
            fontSize: 22,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }

  _launchMovie(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
