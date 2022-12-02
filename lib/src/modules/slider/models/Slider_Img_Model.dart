import 'dart:convert';

List<SliderImgModel> sliderImgModelFromJson(String str) =>
    List<SliderImgModel>.from(
        json.decode(str).map((x) => SliderImgModel.fromJson(x)));

class SliderImgModel {
  SliderImgModel({
    required this.sn,
    required this.title,
    required this.img,
  });

  int sn;
  String title;
  String img;

  factory SliderImgModel.fromJson(Map<String, dynamic> json) => SliderImgModel(
        sn: json["sn"],
        title: json["title"],
        img: json["img"],
      );
}
