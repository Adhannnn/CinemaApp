import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Moviedetail extends StatelessWidget {
  final String movieTitle;
  final String movieDescription;
  final String movieImage;
  final String movieRating;
  final String movieYears;
  final String movieDuration;
  final String movieGenre;

  const Moviedetail(
      {super.key,
      required this.movieTitle,
      required this.movieDescription,
      required this.movieImage,
      required this.movieRating,
      required this.movieYears,
      required this.movieDuration,
      required this.movieGenre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffF5F0E0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Movie Banner Image
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(movieImage), // Use NetworkImage for URLs
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 13.5),
                    width: 36,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 196, 64),
                      border: Border.all(
                        color: const Color.fromARGB(255, 14, 37, 34),
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1, 2),
                          color: Colors.black.withOpacity(1),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color.fromARGB(255, 14, 37, 34),
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Movie Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Movie Poster
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(movieImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Movie Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieTitle,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                // For calendar
                                SvgPicture.asset('assets/icon/calendar.svg'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(movieYears),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(' | '),
                                SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset('assets/icon/clock.svg'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(movieDuration),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(' | '),
                                SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset('assets/icon/film.svg'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(movieGenre),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 4),
                                Text(
                                  movieRating,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                  width: 20,
                                ),
                                Text("2.9k Watchlist"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(),
                  Text(
                    "Synopsis",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movieDescription,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Schedule Section
          ],
        ),
      ),
    );
  }
}
