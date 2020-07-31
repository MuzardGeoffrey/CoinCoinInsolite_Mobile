import 'dart:convert';
import 'package:coincoins_insolites_mobile/model/model_place.dart';

PicturePlaceModel picturePlaceModel(String str) => PicturePlaceModel.fromJson(json.decode(str));

String pictureModelToJson(PicturePlaceModel data) => json.encode(data.toJson());

class PicturePlaceModel{
  int id;
  int idPlace;
  double latitude;
  double longitude;
  PlaceModel place;
  String svgLink;

  PicturePlaceModel({
    this.id,
    this.idPlace,
    this.latitude,
    this.longitude,
    this.place,
    this.svgLink
});

  factory PicturePlaceModel.fromJson(Map<String, dynamic> json) => PicturePlaceModel(
    id: json["id"],
    idPlace: json["idPlace"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    place: json["place"],
    svgLink: json["svgLink"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idPlace": idPlace,
    "latitude": latitude,
    "longitude": longitude,
    "place": place,
    "svgLink": svgLink,
  };
}