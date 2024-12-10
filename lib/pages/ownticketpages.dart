import 'package:cinema_application/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class Voucherpages extends StatefulWidget {
  const Voucherpages({super.key});

  @override
  State<Voucherpages> createState() => _VoucherpagesState();
}

class _VoucherpagesState extends State<Voucherpages> {
  bool isVoucherClicked = false;

  void _toggleButton() {
    setState(() {
      isVoucherClicked = !isVoucherClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F0E0),
        appBar: appBar(),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "Voucher",
                  isClicked: isVoucherClicked,
                  onPressed: () {
                    if (!isVoucherClicked) {
                      _toggleButton();
                    }
                  },
                ),
                SizedBox(width: 8),
                CustomButton(
                  text: "Coupon",
                  isClicked: !isVoucherClicked,
                  onPressed: () {
                    if (isVoucherClicked) {
                      _toggleButton();
                    }
                  },
                ),
              ],
            )
          ],
        ));
  }

  AppBar appBar() {
    return AppBar(
      title: Text("My Voucher / Coupon"),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Montserrat-SemiBold',
        fontSize: 20,
        color: Colors.black,
        letterSpacing: 0.12,
      ),
      backgroundColor: const Color(0xffF5F0E0),
    );
  }
}
