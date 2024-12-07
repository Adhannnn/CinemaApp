import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomBackButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 253, 247),
        border: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 14, 37, 34),
            width: 1.2,
          ),
        ),
      ),
      child: 
      
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          // Back Button
          Container(
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
                Icons.arrow_back_ios_new_outlined,
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

          // Placeholder for symmetry (could add a trailing button here if needed)
          const SizedBox(width: 48), // Ensures symmetry in alignment
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
