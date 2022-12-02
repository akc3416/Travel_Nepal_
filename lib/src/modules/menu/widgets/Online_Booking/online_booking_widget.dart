import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_nepal/src/modules/home/widgets/WebViewPage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlineBookingWidget extends StatefulWidget {
  final String title;
  final IconData icon;
  final String url;
  OnlineBookingWidget(
      {Key? key, required this.title, required this.icon, required this.url})
      : super(key: key);

  @override
  _OnlineBookingWidgetState createState() => _OnlineBookingWidgetState();
}

class _OnlineBookingWidgetState extends State<OnlineBookingWidget> {
  void _handleURLButtonPress(BuildContext context, String url, String title) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WebViewPage(url: url, title: title)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        width: (ScreenUtil.defaultSize.width / 2) + 10,
        child: InkWell(
          highlightColor: Colors.green,
          onTap: () {
            _handleURLButtonPress(context, widget.url, widget.title);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  widget.icon,
                  size: 80.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
