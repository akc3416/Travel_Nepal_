// To parse this JSON data, do
//
//     final transportModel = transportModelFromJson(jsonString);

import 'dart:convert';

List<TransportModel> transportModelFromJson(String str) =>
    List<TransportModel>.from(
        json.decode(str).map((x) => TransportModel.fromJson(x)));

class TransportModel {
  TransportModel({
    required this.sn,
    required this.twofour,
    required this.model,
    required this.lotno,
    required this.mileage,
    required this.condition,
    required this.contact,
    required this.img,
  });

  int sn;
  int twofour;
  String model;
  int lotno;
  int mileage;
  String condition;
  String contact;
  String img;

  factory TransportModel.fromJson(Map<String, dynamic> json) => TransportModel(
        sn: json["sn"] ?? 0,
        twofour: json["twofour"] ?? 0,
        model: json["model"] ?? "",
        lotno: json["lotno"] ?? 0,
        mileage: json["mileage"] ?? 0,
        condition: json["condition"] ?? "",
        contact: json["contact"] ?? "",
        img: json["img"] ?? "",
      );
}
