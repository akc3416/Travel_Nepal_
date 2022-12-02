import 'package:flutter/material.dart';
import 'package:travel_nepal/src/modules/menu/screen/Online_Booking/online_booking_list/online_booking_list_screen.dart';

class OnlineBookingScreen extends StatelessWidget {
  final String title;
  const OnlineBookingScreen({Key? key, required this.title}) : super(key: key);

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
    return OnlineBookingListScreen();
  }
}
