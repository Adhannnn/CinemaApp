import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Moviedetail extends StatefulWidget {
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
  State<Moviedetail> createState() => _MoviedetailState();
}

class _MoviedetailState extends State<Moviedetail> {
  bool isExpanded = false;

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
                      image: AssetImage(
                          widget.movieImage), // Use NetworkImage for URLs
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
                            image: AssetImage(widget.movieImage),
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
                              widget.movieTitle,
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
                                Text(widget.movieYears),
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
                                Text(widget.movieDuration),
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
                                Text(widget.movieGenre),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 4),
                                Text(
                                  widget.movieRating,
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffA7D4CB),
                      border: Border(
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Synopsis",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 8),
                        AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: Text(
                            widget.movieDescription,
                            maxLines:
                                isExpanded ? null : 5, // Show 5 lines initially
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Text(
                            isExpanded ? "Read Less" : "Read More",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  )
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
