import 'dart:convert';

import 'package:coincoins_insolites_mobile/model/model_picturePlace.dart';

PlaceModel placeModelFromJson(String str) => PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJon());

class PlaceModel{
  int id;
  String description;
  double latitude;
  double longitude;
  String title;
  List<PicturePlaceModel> listPicturePlace;

  PlaceModel({
    this.id,
    this.description,
    this.latitude,
    this.longitude,
    this.title,
    this.listPicturePlace
  });

  factory PlaceModel.fromJson(Map<String,dynamic> json) => PlaceModel(
    description: json["description"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    title: json["title"],
    listPicturePlace: json["listPicturePlace"]
  );

  Map<String, dynamic> toJon() => {
    "id": id,
    "description": description,
    "latitude": latitude,
    "longitude": longitude,
    "title": title,
    "listPicturePlace": listPicturePlace
  };
}