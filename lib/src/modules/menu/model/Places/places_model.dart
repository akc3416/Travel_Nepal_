import 'dart:convert';

List<PlacesModel> placesModelFromJson(String str) => List<PlacesModel>.from(
    json.decode(str).map((x) => PlacesModel.fromJson(x)));

class PlacesModel {
  PlacesModel({
    required this.sn,
    required this.name,
    required this.ratings,
    required this.elevation,
    required this.district,
    required this.main,
    required this.weatherlow,
    required this.weatherhigh,
    required this.thingswecanenjoy,
    required this.img,
  });

  int sn;
  String name;
  int ratings;
  int elevation;
  String district;
  String main;
  int weatherlow;
  int weatherhigh;
  String thingswecanenjoy;
  String img;

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
        sn: json["sn"] ?? 0,
        name: json["name"] ?? "",
        ratings: json["ratings"] ?? 0,
        elevation: json["elevation"] ?? 0,
        district: json["district"] ?? "",
        main: json["main"] ?? "",
        weatherlow: json["weatherlow"] ?? 0,
        weatherhigh: json["weatherhigh"] ?? 0,
        thingswecanenjoy: json["thingswecanenjoy"] ?? "",
        img: json["img"] ?? "",
      );
}
