import 'package:cinema_application/pages/homepages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Searchfieldpages extends StatefulWidget {
  const Searchfieldpages({super.key});

  @override
  State<Searchfieldpages> createState() => _SearhfieldpagesState();
}

class _SearhfieldpagesState extends State<Searchfieldpages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F0E0),
      appBar: AppBar(
        backgroundColor: Color(0xffF5F0E0),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepages()));
          },
          child: Container(
              width: 40,
              height: 50,
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
              child: SvgPicture.asset('assets/icon/arrow-back.svg')),
        ),
      ),
      body: Center(
        child: Text("Search Field"),
      ),
    );
  }
}
