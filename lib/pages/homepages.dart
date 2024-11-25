import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cinema_application/models/film.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmptyText = true;

  late List<MovieList> listmoviefirst;

  @override
  void initState() {
    super.initState();
    listmoviefirst = MovieList.getList();

    _controller.addListener(() {
      final isEmptyNow = _controller.text.isEmpty;
      if (isEmptyNow != _isEmptyText) {
        // Hanya setState jika berubah
        setState(() {
          _isEmptyText = isEmptyNow;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBEE),
      appBar: appBar(),
      body: Stack(
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
                    _searchField(),
                    const SizedBox(
                      width: 40,
                    ),
                    _imageSliderbox(),
                    const SizedBox(
                      width: 40,
                    ),
                    _listmoviebox(),
                    const SizedBox(
                      width: 40,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Cinema Application",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Color(0xffFFFBEE),
    );
  }

  Container listMovie() {
    return Container(
      height: 350,
      width: 450,
      color: Color(0xffA7D4CB),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Places widgets at both ends
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Explore Movies",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat-Bold"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.9, right: 8, left: 8, bottom: 8),
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
    );
  }

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

  // Search field widget
  Widget _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Animasi profil menggunakan AnimatedOpacity
          AnimatedOpacity(
            opacity: _isEmptyText ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Visibility(
              visible: _isEmptyText,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/siganteng.jpg'),
                  radius: 24,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Expanded untuk TextField
          Flexible(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isEmptyText ? 350 : 500, // TextField become more longer
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: const TextStyle(fontSize: 14),
                  filled: true,
                  fillColor: const Color.fromRGBO(236, 185, 75, 1),
                  contentPadding: const EdgeInsets.all(14),
                  suffixIcon: _isEmptyText
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            'assets/icon/Search.svg',
                            width: 15,
                            height: 15,
                          ),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 6, 6, 6),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
