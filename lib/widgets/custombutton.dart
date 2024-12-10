import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final bool isClicked;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.isClicked, required this.onPressed});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: 92,
        height: 31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.isClicked ? Colors.black : const Color(0xffF5F0E0),
          border: Border.all(color: const Color(0xff6A958C)),
          boxShadow: const [BoxShadow(offset: Offset(2, 1))],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.isClicked ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
