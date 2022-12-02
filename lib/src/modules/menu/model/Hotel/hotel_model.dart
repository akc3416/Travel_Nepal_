import 'dart:convert';

List<HotelModel> hotelModelFromJson(String str) =>
    List<HotelModel>.from(json.decode(str).map((x) => HotelModel.fromJson(x)));

class HotelModel {
  HotelModel({
    required this.sn,
    required this.name,
    required this.rating,
    required this.location,
    required this.contact,
    required this.email,
    required this.website,
    required this.img,
  });

  int sn;
  String name;
  int rating;
  String location;
  String contact;
  String email;
  String website;
  String img;

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        sn: json["sn"] ?? 0,
        name: json["name"] ?? "",
        rating: json["rating"] ?? 0,
        location: json["location"] ?? "",
        contact: json["contact"] ?? "",
        email: json["email"] ?? "",
        website: json["website"] ?? "",
        img: json["img"] ?? "",
      );
}
