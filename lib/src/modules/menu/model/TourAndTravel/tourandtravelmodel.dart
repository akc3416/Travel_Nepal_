import 'dart:convert';

List<TourAndTravelModel> tourAndTravelModelFromJson(String str) =>
    List<TourAndTravelModel>.from(
        json.decode(str).map((x) => TourAndTravelModel.fromJson(x)));

class TourAndTravelModel {
  TourAndTravelModel({
    required this.sN,
    required this.company,
    required this.address,
    required this.phone,
    required this.mob,
    required this.email,
    required this.contactPerson,
    required this.web,
  });

  int sN;
  String company;
  String address;
  dynamic phone;
  dynamic mob;
  String email;
  String contactPerson;
  String web;

  factory TourAndTravelModel.fromJson(Map<String, dynamic> json) =>
      TourAndTravelModel(
        sN: json["S.N."] ?? 0,
        company: json["COMPANY"] ?? "",
        address: json["ADDRESS"] ?? "",
        phone: json["PHONE "] ?? "",
        mob: json["MOB"] ?? "",
        email: json["EMAIL"] ?? "",
        contactPerson: json["CONTACT PERSON"] ?? "",
        web: json["WEB"] ?? "",
      );
}
