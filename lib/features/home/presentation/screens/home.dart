import 'package:flutter/material.dart';
import 'package:movie_app/features/browse/presentation/screens/browse_screen.dart';
import 'package:movie_app/features/home/presentation/screens/home_screen.dart';
import 'package:movie_app/features/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:movie_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:movie_app/features/search/presentation/screens/search_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          screens[currentIndex],
          Positioned(
            left: 9,
            right: 9,
            bottom: 9,
            child: CustomBottomNav(
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
            ),
          ),
        ],
      ),
    );
  }
}
