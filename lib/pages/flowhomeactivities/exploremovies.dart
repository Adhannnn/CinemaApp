import 'package:cinema_application/models/listmovie.dart';
import 'package:cinema_application/widgets/custombackbutton.dart';
import 'package:cinema_application/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreMovies extends StatefulWidget {
  const ExploreMovies({super.key});

  @override
  State<ExploreMovies> createState() => _ExploreMoviesState();
}

class _ExploreMoviesState extends State<ExploreMovies> {
  bool isVoucherClicked = false;
  late List<AllMovie> nowMovies;
  late List<AllMovie> upcomingMovies;

  @override
  void initState() {
    super.initState();
    nowMovies = AllMovie.getList(); // Method to get 'Now' movies
    upcomingMovies = AllMovie.getUpcoming(); // Method to get 'Upcoming' movies
  }

  void _toggleButton() {
    setState(() {
      isVoucherClicked = !isVoucherClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F0E0),
      appBar: CustomBackButton(
        title: "",
        showBottomBorder: false,
        trailingButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 13.5),
              width: 80,
              height: 36,
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
              child: GestureDetector(
                onTap: () {},
                child: const Center(
                  child: Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: Color.fromARGB(255, 14, 37, 34),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 13.5),
              width: 36,
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
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: Color.fromARGB(255, 14, 37, 34),
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Now',
                isClicked: !isVoucherClicked,
                onPressed: () => _toggleButton(),
              ),
              const SizedBox(width: 5),
              CustomButton(
                text: 'Upcoming',
                isClicked: isVoucherClicked,
                onPressed: () => _toggleButton(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Movie List Display
          Expanded(
            child: ListView.builder(
              itemCount:
                  isVoucherClicked ? upcomingMovies.length : nowMovies.length,
              itemBuilder: (context, index) {
                final movie =
                    isVoucherClicked ? upcomingMovies[index] : nowMovies[index];
                return _movieCard(movie);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _movieCard(AllMovie movie) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffF7C14D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 5),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              movie.images,
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icon/film.svg',
                        height: 16, width: 16),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        movie.genre,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (!isVoucherClicked) ...[
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffDC555E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('assets/icon/star.svg'),
                            const SizedBox(width: 4),
                            Text(
                              movie.rate,
                              style: const TextStyle(
                                color: Color(0xffFFFDF7),
                                fontFamily: "Montserrat-SemiBold",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  movie.moviename,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                if (!isVoucherClicked) ...[
                  Row(
                    children: [
                      SvgPicture.asset('assets/icon/clock.svg'),
                      const SizedBox(width: 4),
                      Text(
                        "${movie.time} Min",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          movie.rating,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
