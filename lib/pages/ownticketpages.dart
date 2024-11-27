import 'package:flutter/material.dart';

class OwnTicketPages extends StatefulWidget {
  const OwnTicketPages({super.key});

  @override
  State<OwnTicketPages> createState() => _OwnTicketPagesState();
}

class _OwnTicketPagesState extends State<OwnTicketPages> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Own Ticket Pages"
        ),
      ),
    );
  }
}