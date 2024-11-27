import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Buttomnavbar extends StatefulWidget {
  final Function(int) onItemTap;

  const Buttomnavbar({super.key, required this.onItemTap});

  @override
  State<Buttomnavbar> createState() => _ButtomnavbarState();
}

class _ButtomnavbarState extends State<Buttomnavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xffF5F0E0),
      currentIndex: _selectedIndex,
      onTap: (index) {
        widget.onItemTap(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: buildNavIcon('assets/icon/home.svg', 0), label: ''),
        BottomNavigationBarItem(
            icon: buildNavIcon('assets/icon/ticket.svg', 1), label: ''),
        BottomNavigationBarItem(
            icon: buildNavIcon('assets/icon/favorite.svg', 2), label: ''),
        BottomNavigationBarItem(
            icon: buildNavIcon('assets/icon/transaction.svg', 3), label: ''),
        BottomNavigationBarItem(
            icon: buildNavIcon('assets/icon/profile.svg', 4), label: '')
      ],
    );
  }

  Widget buildNavIcon(String path, int index) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          color:
              _selectedIndex == index ? Color(0xffFFFDF7) : Colors.transparent,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: SvgPicture.asset(
          path,
          width: 19,
          height: 19,
          colorFilter: _selectedIndex == index
              ? ColorFilter.mode(Color(0xffDC555E), BlendMode.srcIn)
              : null,
        ),
      ),
    );
  }
}
