import 'package:cinema_application/widgets/mainpagesbar.dart';
import 'package:flutter/material.dart';

class Favoritepages extends StatefulWidget {
  const Favoritepages({super.key});

  @override
  State<Favoritepages> createState() => _FavoritepagesState();
}

class _FavoritepagesState extends State<Favoritepages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 253, 247),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: MainPagesBar(title: 'Wishlist'),
      ),
      body: Center(
        child: Text(
          "Favorite Pages"
        ),
      ),
    );
  }
}