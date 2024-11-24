import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F0E0),
      body: Column(
        children: [
          _searchField(),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 100, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(fontSize: 14),
          filled: true,
          fillColor: Color.fromRGBO(236, 185, 75, 100),
          contentPadding: EdgeInsets.all(14),
          suffixIcon: Container(
            width: 50,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  // Untuk icon search
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset('assets/icon/Search.svg'),
                  )
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
