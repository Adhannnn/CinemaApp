import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_application/models/listmovie.dart';
import 'package:cinema_application/models/film.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cinema_application/pages/searchfieldpages.dart';

class Homepages extends StatefulWidget {
  const Homepages({super.key});

  @override
  State<Homepages> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
  late List<MovieList> listmoviefirst;
  late List<AllMovie> allmovie;

  @override
  void initState() {
    super.initState();
    listmoviefirst = MovieList.getList();
    allmovie = AllMovie.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F0E0),
      appBar: appBar(),
      body: homeeee(),
    );
  }

  Stack homeeee() {
    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imageSliderbox(),
                  const SizedBox(height: 5),
                  boxDataUser(),
                  const SizedBox(
                    height: 5,
                  ),
                  _listmoviebox(),
                  const SizedBox(height: 3),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container boxDataUser() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
          color: Color(0xffFFFDF7),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildSection('Level', 'Classic', isBold: true),
          buildDivider(),
          buildSection('Points', '0'),
          buildDivider(),
          buildSectionWithAnIcon('Vouchers', '1', 'assets/icon/ticketicon.svg'),
          buildDivider(),
          buildSectionWithAnIcon('Coupuns', '1', 'assets/icon/coupunicon.svg')
        ],
      ),
    );
  }

  // build section without an icon
  Widget buildSection(String title, String value, {bool isBold = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: "Montserrat-Medium",
            fontSize: 12,
            letterSpacing: 0.12,
            color: Color(0xff6A958C),
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
              fontFamily: "Montserrat-SemiBold",
              fontSize: 12,
              letterSpacing: 0.12,
              color: Colors.black),
        )
      ],
    );
  }

  // build section with an icon
  Widget buildSectionWithAnIcon(String title, String value, String icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 16),
          child: SvgPicture.asset(
            icon,
            width: 30,
            height: 28,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: "Montserrat-SemiBold",
                  fontSize: 12,
                  letterSpacing: 0.12,
                  color: Colors.black),
            ),
            Text(
              value,
              style: TextStyle(
                  fontFamily: "Montserrat-Medium",
                  color: Color(0xff6A958C),
                  letterSpacing: 0.12,
                  fontSize: 12),
            )
          ],
        )
      ],
    );
  }

  // for divider
  Widget buildDivider() {
    return Container(
      height: 37,
      width: 1,
      color: Colors.black,
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xffF5F0E0),
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Searchfieldpages()));
        },
        child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffEDBD50),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(3, 3))
              ],
              border: Border.all(color: const Color(0xFF253C30), width: 3),
            ),
            child: SvgPicture.asset('assets/icon/search2.svg')),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(3, 3))
              ],
              border: Border.all(color: const Color(0xFF253C30)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/siganteng.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
        )
      ],
    );
  }

  // Image Slider Box
  Widget _imageSliderbox() {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3,
                offset: const Offset(3, 2))
          ]),
      child: _imageSlider(),
    );
  }

  Widget _imageSlider() {
    return CarouselSlider.builder(
      itemCount: listmoviefirst.length,
      itemBuilder: (context, index, realIndex) {
        final movie = listmoviefirst[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              movie.images,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 5,
              child: Text(
                movie.nameMovie,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
      options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0),
    );
  }

  // List Movie Box
  Widget _listmoviebox() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3,
                offset: const Offset(3, 2))
          ]),
      child: listMovie(),
    );
  }

  // Movie List
  Container listMovie() {
    return Container(
      height: 500,
      width: 450,
      color: Color(0xffA7D4CB),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Explore Movies",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat-Bold",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat-SemiBold",
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Movie ListView
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allmovie.length,
              itemBuilder: (context, index) {
                return movieCard(allmovie[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Movie Card Widget
  Widget movieCard(AllMovie movie) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.0))],
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie Poster
                Image.asset(
                  movie.images,
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
                // Movie Title and Genre
                Expanded(
                  child: Container(
                    color: Colors.amberAccent,
                    padding: EdgeInsets.all(12),
                    height: 180,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.moviename,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat-Bold",
                              letterSpacing: 0.12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          movie.genre,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      movie.rate,
                      style: TextStyle(
                          color: Color(0xffFFFDF7),
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.12),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
