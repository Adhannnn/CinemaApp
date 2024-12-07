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
      home: MyHomePages(),
    );
  }
}

class MyHomePages extends StatefulWidget {
  MyHomePages({super.key});

  @override
  State<MyHomePages> createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePages> {
  final List<Widget> _pages = [
    Homepages(),
    OwnTicketPages(),
    Favoritepages(),
    Transactionpages(),
    ProfilePages(),
  ];

  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Buttomnavbar(
        onItemTap: _onItemTap,
      ),
    );
  }
}
