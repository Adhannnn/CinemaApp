import 'package:flutter/material.dart';

class Favoritepages extends StatefulWidget {
  const Favoritepages({super.key});

  @override
  State<Favoritepages> createState() => _FavoritepagesState();
}

class _FavoritepagesState extends State<Favoritepages> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Favorite Pages"
        ),
      ),
    );
  }
}