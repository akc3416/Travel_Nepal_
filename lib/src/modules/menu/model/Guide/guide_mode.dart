import 'dart:convert';

List<GuideModel> guideModelFromJson(String str) =>
    List<GuideModel>.from(json.decode(str).map((x) => GuideModel.fromJson(x)));

class GuideModel {
  GuideModel({
    required this.sn,
    required this.name,
    required this.address,
    required this.rating,
    required this.contact,
    required this.img,
  });

  int sn;
  String name;
  String address;
  double rating;
  String contact;
  String img;

  factory GuideModel.fromJson(Map<String, dynamic> json) => GuideModel(
        sn: json["sn"] ?? 0,
        name: json["name"] ?? "",
        address: json["address"] ?? "",
        rating: json["rating"].toDouble() ?? 0.0,
        contact: json["contact"] ?? "",
        img: json["img"] ?? "",
      );
}
