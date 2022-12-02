import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/modules/menu/model/Hotel/hotel_model.dart';
import 'package:travel_nepal/src/modules/slider/models/slider_img_model.dart';

class HotelSliderWiget extends StatefulWidget {
  @override
  _HotelSliderWigetState createState() => _HotelSliderWigetState();
}

class _HotelSliderWigetState extends State<HotelSliderWiget> {
  int _current = 0;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final databaseList = Provider.of<List<DatabaseModel>>(context);
    List<HotelModel> _hotelsliderlist;
    List<HotelModel> _temphotelsliderlist = [];
    if (databaseList.length == 0) {
      return Center(
        child: Text("Loading...."),
      );
    } else {
      List<DatabaseModel> temp = [];
      databaseList.map((data) {
        if (data.key == "hotel") {
          temp.add(data);
        }
      }).toList();

      _hotelsliderlist = hotelModelFromJson(temp[0].body.toString());
      _hotelsliderlist.map((data) {
        if (data.rating == 4) {
          _temphotelsliderlist.add(data);
        }
      }).toList();

      return _body(hotelsliderlist: _temphotelsliderlist);
    }
  }

  Widget _body({required List<HotelModel> hotelsliderlist}) {
    return Container(
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: hotelsliderlist.length,
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: false,
                aspectRatio: 2.0,
                scrollPhysics: BouncingScrollPhysics(),
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            itemBuilder: (BuildContext context, int index, int realIdx) {
              String _title = hotelsliderlist[index].name;
              return InkWell(
                onTap: () {
                  setState(() => loading = false);
                },
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: hotelsliderlist[index].img,
                        fit: BoxFit.cover,
                        width: 800.w,
                        placeholder: (context, url) => SpinKitDoubleBounce(
                          color: Colors.green,
                          size: 50.0,
                          duration: Duration(milliseconds: 1000),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            _title,
                            // 'No. ${imgList.indexOf(imgList[index])} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: hotelsliderlist.map((url) {
                int index = hotelsliderlist.indexOf(url);
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: _current == index ? 15.0 : 8.0,
                  height: _current == index ? 15.0 : 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.all(Radius.elliptical(100, 50)),
                    color: _current == index ? Colors.green : Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
