import 'package:cinema_application/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:cinema_application/widgets/buttomnavbar.dart';

import 'package:cinema_application/pages/favoritepages.dart';
import 'package:cinema_application/pages/homepages.dart';
import 'package:cinema_application/pages/ownticketpages.dart';
import 'package:cinema_application/pages/profilepages.dart';
import 'package:cinema_application/pages/transactionpages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Montserrat',
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      home: HomeScreen(),
    );
  }
}
