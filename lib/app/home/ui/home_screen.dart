import 'package:flutter/material.dart';

import 'widgets/movies_grid_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242226),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            MoviesGridSection(
              sectionTitle: "Recently released",
              height: 160,
              width: 220,
              endpoint: '3/movie/now_playing',
            ),
            const SizedBox(height: 20),
            MoviesGridSection(
              sectionTitle: "Picked you",
              height: 240,
              width: 110,
              endpoint: '3/movie/top_rated',
            ),
            const SizedBox(height: 20),
            MoviesGridSection(
              sectionTitle: "Upcoming",
              height: 160,
              width: 220,
              endpoint: '3/movie/upcoming',
            ),
          ],
        ),
      ),
    );
  }
}