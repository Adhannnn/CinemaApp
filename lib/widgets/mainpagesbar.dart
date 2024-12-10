import 'package:flutter/material.dart';

class MainPagesBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MainPagesBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 253, 247),
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 14, 37, 34),
            width: 1.2,
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 14, 37, 34),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75.0);
}
