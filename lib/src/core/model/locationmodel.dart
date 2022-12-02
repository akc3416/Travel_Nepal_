import 'dart:convert';

List<LocationModel> locationModelFromJson(String str) =>
    List<LocationModel>.from(
        json.decode(str).map((x) => LocationModel.fromJson(x)));

class LocationModel {
  LocationModel({
    required this.id,
    required this.lat,
    required this.lon,
    required this.imgLnk,
    required this.titleEng,
    required this.titleNep,
    required this.detailsEng,
    required this.detailsNep,
  });

  int id;
  double lat;
  double lon;
  String imgLnk;
  String titleEng;
  String titleNep;
  String detailsEng;
  String detailsNep;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        imgLnk: json["img_lnk:"],
        titleEng: json["title_eng"],
        titleNep: json["title_nep"],
        detailsEng: json["details_eng"],
        detailsNep: json["details_nep"],
      );
}
