import 'package:cinema_application/widgets/custombackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreMovies extends StatefulWidget {
  const ExploreMovies({super.key});

  @override
  State<ExploreMovies> createState() => _ExploreMoviesState();
}

class _ExploreMoviesState extends State<ExploreMovies> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmptyText = true;

  void initState() {
    super.initState();

    _controller.addListener(() {
      final isEmptyNow = _controller.text.isEmpty;
      if (isEmptyNow != _isEmptyText) {
        setState(() {
          _isEmptyText = isEmptyNow;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F0E0),
        appBar: CustomBackButton(
          title: "",
          showBottomBorder: false,

          // Customing Custom Back Button
          // this is a changer! - iam
          trailingButton: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 13.5),
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
                  onTap: () {
                    
                  },
                  child: Center(
                    child: Text(
                      "Location",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                        color: Color.fromARGB(255, 14, 37, 34)),
                    ),
                  )
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
                  onPressed: () {
                    
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Color.fromARGB(255, 14, 37, 34),
                    size: 20,
                  ),
                ),
              ),
            ],
          )
        ),
        body: _searchField());
  }

  Widget _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
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
          Flexible(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isEmptyText ? 500 : 500,
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
                      : Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              _controller.clear();
                            },
                            child: Icon(Icons.cancel),
                          )),
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
