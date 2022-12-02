import 'package:flutter/material.dart';
import 'package:travel_nepal/src/modules/menu/screen/Public_Toilet/public_toilet_list.dart';

class PublicToiletScreen extends StatelessWidget {
  final String title;
  const PublicToiletScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        PublicToiletList(),
      ],
    );
  }
}
