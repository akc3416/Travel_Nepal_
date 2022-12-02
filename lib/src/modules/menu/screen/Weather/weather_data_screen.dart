import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travel_nepal/src/shared/preferences.dart';
import 'package:weather/weather.dart';

class WeatherDataScreen extends StatefulWidget {
  WeatherDataScreen({Key? key}) : super(key: key);

  @override
  _WeatherDataScreenState createState() => _WeatherDataScreenState();
}

class _WeatherDataScreenState extends State<WeatherDataScreen> {
  WeatherFactory wf = new WeatherFactory(DataHandler.openWeatherMap_key,
      language: Language.ENGLISH);
  late Position _currentPosition;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text("Celsius: " + _currentPosition.latitude.toString())],
      ),
    );
  }

  void _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
