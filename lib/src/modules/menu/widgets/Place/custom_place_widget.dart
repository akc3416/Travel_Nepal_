import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icons.dart';
import 'package:travel_nepal/src/modules/menu/model/Places/places_model.dart';

class CustomPlaceWidget extends StatefulWidget {
  final BuildContext customContext;
  final PlacesModel placedata;
  CustomPlaceWidget(
      {Key? key, required this.placedata, required this.customContext})
      : super(key: key);

  @override
  _CustomPlaceWidgetState createState() => _CustomPlaceWidgetState();
}

class _CustomPlaceWidgetState extends State<CustomPlaceWidget> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: ScreenUtil().screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: _body(context),
      ),
      onTap: () {
        _noticeBottomSheet(widget.customContext);
      },
    );
  }

  Widget _body(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: widget.placedata.img,
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
          Text(widget.placedata.name.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp)),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
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
                  child: widget.placedata.img != ""
                      ? Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.placedata.img,
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
                        widget.placedata.name,
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
                            initialRating: widget.placedata.ratings.toDouble(),
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
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Elevation : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.placedata.elevation.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 33.sp)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        child: Row(
                          children: [
                            Text("District : ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 33.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(widget.placedata.district,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 33.sp)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        child: Row(
                          children: [
                            Text("Weather : ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 33.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                widget.placedata.weatherlow.toString() +
                                    " - " +
                                    widget.placedata.weatherhigh.toString(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 33.sp)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        child: Row(
                          children: [
                            Text("Attraction : ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 33.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(widget.placedata.main,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 33.sp)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Thing We Can Enjoy : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 33.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              child: Text(widget.placedata.thingswecanenjoy,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 33.sp)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
