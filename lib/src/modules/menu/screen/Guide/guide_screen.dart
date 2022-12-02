import 'package:flutter/material.dart';
import 'package:travel_nepal/src/modules/menu/screen/Guide/Guide_list_screen.dart/guide_list_screen.dart';

class GuideScreen extends StatelessWidget {
  final String title;
  const GuideScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return GuideListScreen();
  }
}
