import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_nepal/src/modules/menu/model/TourAndTravel/tourandtravelmodel.dart';

class CustomTourAndTravelWidget extends StatefulWidget {
  final BuildContext customContext;
  final TourAndTravelModel tourandtraveldata;
  CustomTourAndTravelWidget(
      {Key? key, required this.customContext, required this.tourandtraveldata})
      : super(key: key);

  @override
  _CustomTourAndTravelWidgetState createState() =>
      _CustomTourAndTravelWidgetState();
}

class _CustomTourAndTravelWidgetState extends State<CustomTourAndTravelWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Card(
        elevation: 5.0,
        child: InkWell(
          onTap: () {
            _noticeBottomSheet(widget.customContext);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(widget.tourandtraveldata.company,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 40.sp)),
              ],
            ),
          ),
        ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        widget.tourandtraveldata.company,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Location : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.tourandtraveldata.address,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 33.sp)),
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
                          Text(widget.tourandtraveldata.email,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 33.sp)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
