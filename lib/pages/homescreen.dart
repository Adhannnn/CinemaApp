import 'package:cinema_application/pages/favoritepages.dart';
import 'package:cinema_application/pages/homepages.dart';
import 'package:cinema_application/pages/ownticketpages.dart';
import 'package:cinema_application/pages/profilepages.dart';
import 'package:cinema_application/pages/transactionpages.dart';
import 'package:cinema_application/widgets/buttomnavbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    Homepages(),
    Voucherpages(),
    Favoritepages(),
    Transactionpages(),
    ProfilePages(), // Profile page is here, part of the _pages list
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
      backgroundColor: const Color(0xffF5F0E0),
      body: _pages[_selectedIndex], // Displays the selected page
      bottomNavigationBar:
          Buttomnavbar(onItemTap: _onItemTap), // The BottomNavbar stays intact
    );
  }
}
