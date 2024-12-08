import 'package:flutter/material.dart';

class Moviedetails extends StatefulWidget {
  const Moviedetails({super.key});

  @override
  State<Moviedetails> createState() => _MoviedetailsState();
}

class _MoviedetailsState extends State<Moviedetails> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100, // Example height, adjust as needed
                color: Colors.cyan,
                child: Center(child: Text("Picture")),
              ),
              Container(
                width: double.infinity,
                height: 100, // Example height, adjust as needed
                color: Colors.green,
                child: Center(child: Text("Details")),
              ),
              Container(
                width: double.infinity,
                height: 100, // Example height, adjust as needed
                color: Colors.white,
                child: Center(child: Text("Rating & Watchlist")),
              ),
              Container(
                width: double.infinity,
                height: 100, // Example height, adjust as needed
                color: Colors.cyan,
                child: Center(child: Text("Synopsis")),
              ),
              Container(
                width: double.infinity,
                height: 400, // Example height, adjust as needed
                color: const Color.fromARGB(255, 212, 195, 65),
                child: Center(child: Text("Show")),
              ),
            ],
          ),
        ),

        // Bar with Back Button
        Positioned(
          top: 13.5,
          left: 16,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 196, 64), // orange
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
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0, // Remove shadow
              highlightElevation: 0, // Remove shadow on press
              hoverElevation: 0, // Remove shadow when hovering
              disabledElevation: 0, // Remove shadow when disabled
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color.fromARGB(255, 14, 37, 34),
                size: 18,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

}
