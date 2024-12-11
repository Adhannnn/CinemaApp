import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBottomBorder;
  final Widget? trailingButton;

  CustomBackButton({
    required this.title,
    this.showBottomBorder = true,
    this.trailingButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 253, 247),
        border: showBottomBorder
            ? const Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 14, 37, 34),
                  width: 1.2,
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 13.5),
            width: 36,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 196, 64),
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
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color.fromARGB(255, 14, 37, 34),
                size: 18,
              ),
            ),
          ),

          // Title
          Expanded(
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

          // optional trailing button
          trailingButton ?? // this is cool, idk why
              const SizedBox(
                width: 48,
              ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
