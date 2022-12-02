import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travel_nepal/src/modules/menu/model/Guide/guide_mode.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomGuideWidget extends StatefulWidget {
  final GuideModel guidedata;
  CustomGuideWidget({Key? key, required this.guidedata}) : super(key: key);

  @override
  _CustomGuideWidgetState createState() => _CustomGuideWidgetState();
}

class _CustomGuideWidgetState extends State<CustomGuideWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.guidedata.img,
                    fit: BoxFit.cover,
                    width: 150.w,
                    placeholder: (context, url) => SpinKitDoubleBounce(
                      color: Colors.green,
                      size: 50.0,
                      duration: Duration(milliseconds: 1000),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: ScreenUtil().screenWidth,
                      height: 60.h,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        border: Border.all(
                          // color: Colors.white,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30.0),
                        // boxShadow: [
                        //   BoxShadow(color: Colors.green, spreadRadius: 3),
                        // ],
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.guidedata.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text("Rating: "),
                        RatingBar.builder(
                          initialRating: widget.guidedata.rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          maxRating: 5,
                          itemSize: 30.sp,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            LineIcons.starAlt,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("Address: " + widget.guidedata.address),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          LineIcons.phone,
                          size: 40.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            launchUrl(widget.guidedata.contact);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              widget.guidedata.contact,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
