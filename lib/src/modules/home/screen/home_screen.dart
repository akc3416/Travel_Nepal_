import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travel_nepal/src/core/Custom/ScrollBehavior.dart';
import 'package:travel_nepal/src/modules/home/widgets/WebViewPage.dart';
import 'package:travel_nepal/src/modules/home/widgets/WebViewPage2.dart';
import 'package:travel_nepal/src/modules/home/widgets/WebViewPage3.dart';
import 'package:travel_nepal/src/modules/home/widgets/WebViewPage4.dart';
import 'package:travel_nepal/src/modules/menu/screen/FeedBack/feedback_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/Weather/weather_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/menu_screen.dart';
import 'package:travel_nepal/src/modules/slider/widgets/Slider_Widget.dart';
import 'package:travel_nepal/src/shared/preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => showAlert(context));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Travel Nepal"),
      ),
      body: _body(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: DataHandler.currentindex,
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(LineIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(LineIcons.film),
            label: "Entertainment",
          ),
          BottomNavigationBarItem(
            icon: new Icon(LineIcons.coins),
            label: "Currency",
          ),
          BottomNavigationBarItem(
            icon: new Icon(LineIcons.wind),
            label: "Weather",
          ),
          BottomNavigationBarItem(
            icon: new Icon(LineIcons.starHalfAlt),
            label: "FAQ",
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      DataHandler.currentindex = index;
    });
  }

  Widget _body() {
    switch (DataHandler.currentindex) {
      case 0:
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SliderWidget(),
                MenuScreen(),
              ],
            ),
          ),
        );
      case 1:
        return WebViewPage2(url: "https://www.crazygames.com/game/ludo-king");
      case 2:
        return WebViewPage3(url: "https://cuex.com/en/");
      case 3:
        return WebViewPage4(url: "https://weather.com/");
      case 4:
        return FeedBackScreen(
          hemail: 'sambagrg2015@gmail.com',
        );
      default:
        return Container();
    }
  }

  // void showAlert(BuildContext context) {
  //   if (DataHandler.tourorlocal == "") {
  //     showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //               content: Container(
  //                 height: ScreenUtil.defaultSize.height / 4,
  //                 child: Column(children: [
  //                   Text(
  //                     "Select Who You Are!",
  //                     style: TextStyle(
  //                         fontSize: 50.sp, fontWeight: FontWeight.bold),
  //                   ),
  //                   SizedBox(
  //                     height: 10.h,
  //                   ),
  //                   // Custom button
  //                   _custom_button("Tourist", () {
  //                     DataHandler.tourorlocal = "tourist";
  //                     Navigator.pop(context);
  //                   }),
  //                   SizedBox(
  //                     height: 10.h,
  //                   ),
  //                   _custom_button("Local", () {
  //                     DataHandler.tourorlocal = "Local";
  //                     Navigator.pop(context);
  //                   })
  //                 ]),
  //               ),
  //             ));
  //   }
  // }

  Widget _custom_button(String title, VoidCallback onCardSelected) {
    return Container(
      height: 100.h,
      width: 400.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      child: InkWell(
        onTap: onCardSelected,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
