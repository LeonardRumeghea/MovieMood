import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_app/core/Entities/director.dart';
import 'package:mobile_app/core/Entities/genre.dart';
import 'package:mobile_app/core/Entities/movie.dart';
import 'package:mobile_app/core/constants.dart';
import 'package:mobile_app/screens/movie_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlists'),
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

    pageContent.add(_getAppBar(screenSize));

    pageContent.add(_buildList(screenSize, 'Favorites', false));
    pageContent.add(_buildList(screenSize, 'Watch later', true));
    pageContent.add(_buildList(screenSize, 'Watched', false));

    pageContent.add(_getAddListButton(screenSize));

    return pageContent;
  }

  _getAppBar(Size screenSize) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * .025,
        left: screenSize.width * .025,
        right: screenSize.width * .025,
      ),
      child: Container(
        padding: EdgeInsets.all(screenSize.width * .0125),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade800,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade900, blurRadius: 2, spreadRadius: 2),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: screenSize.width * .1,
                  backgroundImage: const NetworkImage(
                      "https://sb.kaleidousercontent.com/67418/1920x1545/c5f15ac173/samuel-raita-ridxdghg7pw-unsplash.jpg"),
                ),
                const SizedBox(width: 10),
                const Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              color: accentColor,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildList(Size screenSize, String label, bool empty) {
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
      Image image = Image.network(links[imgIndex],
          height: screenSize.height * 0.4, width: screenSize.width * 0.8);
      listItems.add(_buildCard(screenSize, movie, image));
      links.removeAt(imgIndex);
    }

    if (empty) listItems = [];

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

  Widget _buildCard(Size screenSize, Movie movie, Image image) {
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

  _getAddListButton(Size screenSize) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.025),
        child: GestureDetector(
          onTap: () => _showAddListDialog(screenSize),
          child: Container(
            width: screenSize.width * 0.6,
            height: screenSize.height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: accentColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade900,
                    blurRadius: 5,
                    spreadRadius: 5),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                Text('Add new list',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showAddListDialog(Size screenSize) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new list'),
          content: SizedBox(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: const OutlineInputBorder(),
                fillColor: accentColor,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: accentColor?.withOpacity(0.75), fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Submit',
                  style: TextStyle(color: accentColor, fontSize: 18)),
            ),
          ],
        );
      },
    );
  }
}
