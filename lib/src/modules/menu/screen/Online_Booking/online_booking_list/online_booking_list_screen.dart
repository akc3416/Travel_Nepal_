import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travel_nepal/src/modules/menu/widgets/Online_Booking/online_booking_widget.dart';

class OnlineBookingListScreen extends StatefulWidget {
  OnlineBookingListScreen({Key? key}) : super(key: key);

  @override
  _OnlineBookingListScreenState createState() =>
      _OnlineBookingListScreenState();
}

class _OnlineBookingListScreenState extends State<OnlineBookingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height / 2) - 150,
          ),
          OnlineBookingWidget(
            icon: LineIcons.planeDeparture,
            title: "Flights",
            url: "https://www.cleartrip.com",
          ),
          SizedBox(
            height: 10.h,
          ),
          OnlineBookingWidget(
            icon: LineIcons.hotel,
            title: "Hotels",
            url: "https://www.oyorooms.com/np",
          ),
          SizedBox(
            height: 10.h,
          ),
          OnlineBookingWidget(
            icon: LineIcons.hiking,
            title: "Adventure",
            url: "https://www.bestadventurenepal.com/book-now",
          ),
        ],
      ),
    );
  }
}
