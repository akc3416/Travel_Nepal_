import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_nepal/src/core/custom/ScrollBehavior.dart';
import 'package:travel_nepal/src/modules/menu/screen/Hotel/Hotel_list/hotel_list_screen.dart';
import 'package:travel_nepal/src/modules/slider/widgets/hotel/hotel_slider_widget.dart';

class HotelScreen extends StatelessWidget {
  final String title;
  const HotelScreen({Key? key, required this.title}) : super(key: key);

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
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HotelSliderWiget(),
            SizedBox(
              height: 10.h,
            ),
            HotelListScreen(),
          ],
        ),
      ),
    );
  }
}
