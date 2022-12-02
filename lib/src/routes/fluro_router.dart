import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:travel_nepal/src/core/handler/error_handler.dart';
import 'package:travel_nepal/src/routes/route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String initial = "/initial";

  // menu
  static String hotel = "/hotel/:title";
  static String tourandtravel = "/tourandtravel/:title";
  static String atm = "/atm/:title";
  static String onlinebooking = "/onlinebooking/:title";
  static String guide = "/guide/:title";
  static String place = "/place/:title";
  static String publictoilet = "/publictoilet/:title";

  static void setupRouter(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const RouteError();
    });
    router.define(root, handler: homeScreenHandler);
    router.define(home,
        handler: homeScreenHandler, transitionType: TransitionType.fadeIn);

    // Menu
    router.define(hotel,
        handler: hotelScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(tourandtravel,
        handler: tourAndTravelScreenHandler,
        transitionType: TransitionType.fadeIn);
    router.define(atm,
        handler: atmScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(onlinebooking,
        handler: onlineBookingScreenHandler,
        transitionType: TransitionType.fadeIn);
    router.define(guide,
        handler: guideScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(place,
        handler: placeScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(publictoilet,
        handler: publicToiletScreenHandler,
        transitionType: TransitionType.fadeIn);
  }
}
