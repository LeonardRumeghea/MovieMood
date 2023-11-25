import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_app/core/Entities/director.dart';
import 'package:mobile_app/core/Entities/genre.dart';
import 'package:mobile_app/core/Entities/movie.dart';
import 'package:mobile_app/core/constants.dart';
import 'package:mobile_app/screens/movie_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome back, John Doe!'),
        backgroundColor: accentColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * .025,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: _buildPageContent(screenSize),
          ),
        ),
      ),
    );
  }

  _buildPageContent(Size screenSize) {
    List<Widget> pageContent = [];

    pageContent.add(_buildList(screenSize, 'Recently added'));
    pageContent.add(_buildList(screenSize, 'Popular now'));
    pageContent.add(_buildList(screenSize, 'Recommended for you'));

    return pageContent;
  }

  Column _buildList(Size screenSize, String label) {
    List<Widget> listItems = [];
    Movie movie = Movie(
      title: 'Barbie',
      releaseDate: DateTime.parse("2023-07-23"),
      description:
          'A doll living in Barbieland is expelled for not being perfect enough and sets off on an adventure in the real world. A Live-action feature film based on the popular line of Barbie toys.',
      director: Director(
          firstName: "Greta",
          lastName: "Gerwing",
          dateOfBirth: "4/08/1983",
          biography: "",
          nationality: "",
          filmography: [],
          style: []),
      cast: [],
      genres: [Genre.comedy, Genre.fantasy],
      rating: 7.0,
    );
    var links = [
      "https://image.tmdb.org/t/p/original/u5kboZR4OMi4QdbOhawCZuzMVWJ.jpg",
      "https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg",
      "https://www.vintagemovieposters.co.uk/wp-content/uploads/2023/03/IMG_1887-scaled.jpeg",
      "https://m.media-amazon.com/images/I/5161KW51G2L._AC_UF1000,1000_QL80_.jpg",
      "https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/6408f6e7b5811271dc883aa8_batman-min.png",
      "https://m.media-amazon.com/images/I/71eHZFw+GlL._AC_UF894,1000_QL80_.jpg",
      "https://www.tallengestore.com/cdn/shop/products/Oppenheimer-CillianMurphy-ChristopherNolan-HollywoodMoviePoster_1_0d1586b1-e2a3-48ea-84a0-fd76268635f4.jpg?v=1647424462",
      "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
      "https://i.pinimg.com/736x/fe/e7/ea/fee7eab62f787cf7bbd3aa3cce3ac833.jpg",
      "https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/6408f76710a9935109f855d4_smile-min.png",
    ];
    for (int i = 0; i < 10; i++) {
      var imgIndex = Random().nextInt(links.length);
      Image image = Image.network(
        // get a random image from the list
        links[imgIndex],
        height: screenSize.height * 0.4,
        width: screenSize.width * 0.8,
      );
      listItems.add(buildCard(screenSize, movie, image));
      links.removeAt(imgIndex);
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenSize.height * .025),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: listItems,
            ),
          ),
          const Divider(thickness: 1),
        ]);
  }

  buildCard(Size screenSize, Movie movie, Image image) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      height: screenSize.height * 0.3,
      width: screenSize.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade900, blurRadius: 2, spreadRadius: 2),
        ],
        image: DecorationImage(
          image: image.image,
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieView(movie: movie),
            ),
          );
        },
      ),
    );
  }
}
