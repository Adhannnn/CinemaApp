import 'package:flutter/material.dart';

class ProfilePages extends StatefulWidget {
  ProfilePages({super.key});

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  final TextEditingController _controller = TextEditingController();
  

  bool _isEmptyText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello gais",
        ),
      ),
    );
  }
}


 