import 'package:flutter/material.dart';
import 'package:mobile_app/core/constants.dart';
import 'package:mobile_app/screens/home_screen.dart';
import 'package:mobile_app/screens/poster_detector.dart';
import 'package:mobile_app/screens/profile_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(primaryColor: accentColor),
        home: const Navigation());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) =>
            setState(() => currentPageIndex = index),
        indicatorColor: accentColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, size: 30),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.camera_alt_rounded, size: 30),
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Poster detection',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, size: 30),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const HomeScreen(),
        const PosterDetector(),
        const ProfileScreen(),
      ][currentPageIndex],
    );
  }
}
