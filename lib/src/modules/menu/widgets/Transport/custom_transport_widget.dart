import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travel_nepal/src/modules/menu/model/Transport/transport_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTransportWidget extends StatefulWidget {
  final BuildContext customContext;
  final TransportModel transportList;
  CustomTransportWidget(
      {Key? key, required this.customContext, required this.transportList})
      : super(key: key);

  @override
  _CustomTransportWidgetState createState() => _CustomTransportWidgetState();
}

class _CustomTransportWidgetState extends State<CustomTransportWidget> {
  bool _loading = false;
  String _url = "";
  @override
  void dispose() {
    super.dispose();
  }

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
                  child: widget.transportList.img != ""
                      ? Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.transportList.img,
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
                        widget.transportList.model.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Lot No. : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.transportList.lotno.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 33.sp)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Mileage : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.transportList.mileage.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 33.sp)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Condition : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.transportList.condition.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 33.sp)),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      InkWell(
                        onTap: () {
                          setState(() {
                            setState(() {
                              _url = "tel:" + widget.transportList.contact;
                            });
                            _launchURL();
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Text("Contact No. : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 33.sp,
                                      fontWeight: FontWeight.bold)),
                              Text(widget.transportList.contact.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 33.sp)),
                            ],
                          ),
                        ),
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

  Widget _body(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: widget.transportList.img,
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
          Text(widget.transportList.model,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp)),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
