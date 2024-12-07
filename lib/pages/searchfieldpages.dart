import 'package:cinema_application/widgets/custombackbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Searchfieldpages extends StatefulWidget {
  const Searchfieldpages({super.key});

  @override
  State<Searchfieldpages> createState() => _SearhfieldpagesState();
}

class _SearhfieldpagesState extends State<Searchfieldpages> {
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
        appBar: CustomBackButton(title: 'Search'),
        body: _searchField());
  }

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
