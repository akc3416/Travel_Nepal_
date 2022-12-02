import 'package:flutter/material.dart';
import 'package:travel_nepal/src/modules/menu/screen/TourandTravel/TourandTravelList/tour_and_travel_list_screen.dart';

class TourAndTravelScreen extends StatelessWidget {
  final String title;
  const TourAndTravelScreen({Key? key, required this.title}) : super(key: key);

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
    return TourAndTravelListScreen();
  }
}
