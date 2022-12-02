import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_nepal/src/modules/home/screen/home_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/ATM/atm_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/Guide/guide_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/Hotel/hotel_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/Online_Booking/online_booking_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/Place/place_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/Public_Toilet/public_toilet_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/TourandTravel/tour_and_travel_screen.dart';
import 'package:travel_nepal/src/startup_model.dart';

var startUpModelHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const StartUpModel();
});

var homeScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomeScreen();
});

// Menu
var hotelScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  var title = params['title']![0];
  return HotelScreen(
    title: title,
  );
});

var tourAndTravelScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  var title = params['title']![0];
  return TourAndTravelScreen(
    title: title,
  );
});

var atmScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  var title = params['title']![0];
  return ATMScreen(
    title: title,
  );
});

var onlineBookingScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  var title = params['title']![0];
  return OnlineBookingScreen(
    title: title,
  );
});

var guideScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  var title = params['title']![0];
  return GuideScreen(
    title: title,
  );
});

var placeScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  var title = params['title']![0];
  return PlaceScreen(
    title: title,
  );
});

var publicToiletScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  var title = params['title']![0];
  return PublicToiletScreen(
    title: title,
  );
});
