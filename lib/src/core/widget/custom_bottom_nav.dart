import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
