import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travel_nepal/src/modules/menu/model/Hotel/hotel_model.dart';
import 'package:travel_nepal/src/modules/menu/screen/Hotel/hotel_form_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomHotelCardWidget extends StatefulWidget {
  final BuildContext customContext;
  final HotelModel hotellist;
  CustomHotelCardWidget(
      {Key? key, required this.hotellist, required this.customContext})
      : super(key: key);

  @override
  _CustomHotelCardWidgetState createState() => _CustomHotelCardWidgetState();
}

class _CustomHotelCardWidgetState extends State<CustomHotelCardWidget> {
  bool _loading = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return InkWell(
      child: Container(
        width: ScreenUtil().screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Card(
          elevation: 5.0,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: widget.hotellist.img != ""
                    ? widget.hotellist.img
                    : "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
                fit: BoxFit.cover,
                width: ScreenUtil().screenWidth,
                height: 200.h,
                placeholder: (context, url) => SpinKitDoubleBounce(
                  color: Colors.green,
                  size: 50.0,
                  duration: Duration(milliseconds: 1000),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(widget.hotellist.name,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp)),
              SizedBox(
                height: 10.h,
              ),
              RatingBar.builder(
                initialRating: widget.hotellist.rating.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                maxRating: 5,
                itemSize: 60.sp,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  LineIcons.starAlt,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        _noticeBottomSheet(widget.customContext);
      },
    );
  }

  void _noticeBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        builder: (BuildContext bc) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: new ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: widget.hotellist.img != ""
                      ? Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.hotellist.img,
                              fit: BoxFit.cover,
                              height: 500.h,
                              width: MediaQuery.of(context).size.width,
                              placeholder: (context, url) =>
                                  SpinKitDoubleBounce(
                                color: Colors.green,
                                size: 50.0,
                                duration: Duration(milliseconds: 1000),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        widget.hotellist.name.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Rating : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.bold)),
                          RatingBar.builder(
                            initialRating: widget.hotellist.rating.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            maxRating: 5,
                            itemSize: 40.sp,
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
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Location : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.hotellist.location.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 33.sp)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Contact : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.bold)),
                          InkWell(
                            onTap: () {
                              launchUrl("tel://" +
                                  widget.hotellist.contact.toString());
                            },
                            child: Text(
                              widget.hotellist.contact.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 33.sp),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Email : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.hotellist.email.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 33.sp)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Align(
                          alignment: Alignment.center,
                          child: Card(
                            elevation: 2.0,
                            child: Container(
                              width: 300.w,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelFormScreen(
                                              hemail:
                                                  widget.hotellist.email.trim(),
                                            )),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(fontSize: 30.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
