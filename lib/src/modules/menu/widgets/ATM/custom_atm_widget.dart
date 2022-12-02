import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_nepal/src/core/model/LocationModel.dart';

class CustomATMWidget extends StatefulWidget {
  final String location;
  const CustomATMWidget({Key? key, required this.location}) : super(key: key);
  @override
  _CustomATMWidgetState createState() => _CustomATMWidgetState();
}

class _CustomATMWidgetState extends State<CustomATMWidget> {
  Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;
  late List<LocationModel> locationList;
  late List<Marker> markerlist;
  late List<bool> locationselected;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  IconData _mapTypeicon = Icons.map;
  int mapidindex = 0;
  double dlat = 27.696155364657947;
  double dlon = 84.43893936063843;
  int count = 0;
  bool homebutton = true;
  bool _initialized = false;
  bool _error = false;
  late BitmapDescriptor customIcon;

  @override
  void initState() {
    super.initState();
    loadLocationModel();
  }

  void loadLocationModel() async {
    try {
      String _response = widget.location;
      locationList = locationModelFromJson(_response.toString());
      locationList.map((data) {
        buildMarkers(data, false);
      }).toList();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
      print("Fail to Convery Json Location");
    }
  }

  buildMarkers(LocationModel locationData, bool selected) {
    var markerIdVal = 2021 + locationData.id;
    final MarkerId markerId = MarkerId(markerIdVal.toString());
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        locationData.lat,
        locationData.lon,
      ),
      infoWindow: InfoWindow(title: locationData.titleEng),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    if (_error) {
      print("Fail to fetch Location Json Data");
    }
    if (!_initialized) {
      return SpinKitCubeGrid(
        color: Colors.blue,
      );
    }
    // Execute when all data are loaded

    return Stack(
      children: <Widget>[
        _buildGoogleMap(context),
        _buildContainer(context),
        _topMapButton(context),
      ],
    );
  }

  Widget _topMapButton(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(top: 5, left: 11, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100.w,
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 20.0,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.home_outlined),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        homebutton = true;
                      });
                      locationList.map((data) {
                        buildMarkers(data, false);
                      }).toList();
                      _gotoHomeLocation(dlat, dlon);
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                FloatingActionButton(
                  onPressed: _onMapTypeButtonPressed,
                  child: Icon(_mapTypeicon),
                ),
                // IconButton(
                //     icon: Icon(FontAwesomeIcons.searchMinus,
                //         color: Color(0xff6200ee)),
                //     onPressed: () {
                //       zoomVal--;
                //       _minus(zoomVal);
                //     }),
                // IconButton(
                //     icon:
                //         Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
                //     onPressed: () {
                //       zoomVal++;
                //       _plus(zoomVal);
                //     }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(),
        height: ScreenUtil.defaultSize.height / 9,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: locationList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: _boxes(
                  context,
                  locationList[index],
                  locationList[index].imgLnk,
                  locationList[index].lat,
                  locationList[index].lon,
                  locationList[index].titleEng,
                  locationList[index].id,
                  index),
            );
          },
        ),
      ),
    );
  }

  Widget _boxes(BuildContext context, LocationModel locationData, String _image,
      double lat, double long, String locationName, int id, int index) {
    return GestureDetector(
      onTap: () {
        mapidindex = index;
        // var markerIdVal = 2021 + id;
        // final MarkerId markerId = MarkerId(markerIdVal.toString());

        setState(() {
          homebutton = false;
          markers.clear();
          buildMarkers(locationData, true);
        });
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(5.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(context, locationName, index),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(
      BuildContext context, String locationName, int index) {
    String detail;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            child: Text(
          locationName,
          style: TextStyle(
              color: Color(0xff6200ee),
              fontSize: 15.sp,
              fontWeight: FontWeight.bold),
        )),
        // Container(
        //     child: Text(
        //   detail,
        //   style: TextStyle(
        //     color: Colors.black54,
        //     fontSize: 32.sp,
        //   ),
        // )),
        // SizedBox(height: 5.0),
        // Container(
        //     child: Text(
        //   "Closed \u00B7 Opens 17:00 Thu",
        //   style: TextStyle(
        //       color: Colors.black54,
        //       fontSize: 18.0,
        //       fontWeight: FontWeight.bold),
        // )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        compassEnabled: true,
        zoomControlsEnabled: false,
        trafficEnabled: true,
        mapType: _currentMapType,
        initialCameraPosition:
            CameraPosition(target: LatLng(dlat, dlon), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double lon) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, lon),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }

  Future<void> _gotoHomeLocation(double lat, double lon) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lon), zoom: 12),
      ),
    );
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
      _mapTypeicon =
          _mapTypeicon == Icons.map ? Icons.satellite_outlined : Icons.map;
    });
  }

  // Future<void> _minus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: mapidindex != null
  //             ? LatLng(
  //                 locationList[mapidindex].lat, locationList[mapidindex].long)
  //             : LatLng(dlat, dlong),
  //         zoom: zoomVal,
  //       ),
  //     ),
  //   );
  // }

  // Future<void> _plus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: mapidindex != null
  //             ? LatLng(
  //                 locationList[mapidindex].lat, locationList[mapidindex].long)
  //             : LatLng(dlat, dlong),
  //         zoom: zoomVal,
  //       ),
  //     ),
  //   );
  // }
}
