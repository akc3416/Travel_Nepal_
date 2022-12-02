import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/modules/home/widgets/WebViewPage.dart';
import 'package:travel_nepal/src/modules/menu/screen/Transport/transport_list/transport_list_screen.dart';
import 'package:travel_nepal/src/modules/menu/screen/Transport/transport_screen.dart';
import 'package:travel_nepal/src/modules/menu/widgets/Menu_Card_Widget.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.all(4.0),
      primary: false,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      crossAxisCount: 3,
      children: [
        MenuCardWidget(
          name: "Hotel",
          path: "assets/icons/hotel.png",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/hotel/" + "Hotel",
            );
          },
        ),
        MenuCardWidget(
          name: "Transport",
          path: "assets/icons/bike&car.png",
          onCardSelected: () {
            showAlert(context);
          },
        ),
        MenuCardWidget(
          name: "Tours and Travel",
          path: "assets/icons/tour.png",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/tourandtravel/" + "Tour And Travel",
            );
          },
        ),
        MenuCardWidget(
          name: "ATM",
          path: "assets/icons/atm.jpg",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/atm/" + "ATM",
            );
          },
        ),
        MenuCardWidget(
          name: "Online Booking",
          path: "assets/icons/ebooking.png",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/onlinebooking/" + "Online Booking",
            );
          },
        ),
        MenuCardWidget(
          name: "Route Marker",
          path: "assets/icons/route-maker.png",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/routemaker/" + "Route Marker",
            );
          },
        ),
        MenuCardWidget(
          name: "Guide",
          path: "assets/icons/guide.jpg",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/guide/" + "Guide",
            );
          },
        ),
        MenuCardWidget(
          name: "Places",
          path: "assets/icons/places.png",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/place/" + "Places",
            );
          },
        ),
        MenuCardWidget(
          name: "Shop",
          path: "assets/icons/shop.png",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/shop/" + "Shop",
            );
          },
        ),
        MenuCardWidget(
          name: "Transaction History",
          path: "assets/icons/transaction.png",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/transaction/" + "Transaction History",
            );
          },
        ),
        MenuCardWidget(
          name: "News",
          path: "assets/icons/news.png",
          onCardSelected: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewPage(
                        url: "https://kathmandupost.com/travel",
                        title: "News")));
            // Navigator.pushNamed(
            //   context,
            //   "/news/" + "News",
            // );
          },
        ),
        MenuCardWidget(
          name: "Public Toilet",
          path: "assets/icons/public-toilet.png",
          onCardSelected: () {
            Navigator.pushNamed(
              context,
              "/publictoilet/" + "Public Toilet",
            );
          },
        ),
      ],
    );
  }

  void showAlert(BuildContext dcontext) {
    showDialog(
        context: dcontext,
        builder: (context) => AlertDialog(
              content: Container(
                height: ScreenUtil.defaultSize.height / 4,
                child: Column(children: [
                  Text(
                    "Select Type!",
                    style:
                        TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Custom button
                  _custom_button("Two Wheeler", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (dcontext) => TransportScreen(
                                title: "Transport",
                                type: 2,
                              )),
                    );
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  _custom_button("Four Wheeler", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (dcontext) => TransportScreen(
                                title: "Transport",
                                type: 4,
                              )),
                    );
                  })
                ]),
              ),
            ));
  }

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
