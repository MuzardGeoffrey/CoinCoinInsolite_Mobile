import 'dart:convert';

import 'model_user.dart';

PictureUserModel pictureUser(String str) => PictureUserModel.fromJson(json.decode(str));

String pictureModelToJson(PictureUserModel data) => json.encode(data.toJon());

class PictureUserModel{
  int id;
  int idUser;
  double latitude;
  double longitude;
  String svgLink;
  UserModel user;

  PictureUserModel({
    this.id,
    this.idUser,
    this.latitude,
    this.longitude,
    this.svgLink,
    this.user
  });

  factory PictureUserModel.fromJson(Map<String, dynamic> json) => PictureUserModel(
      id: json["id"],
      idUser: json["idUser"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      svgLink: json["svgLink"],
      user: json["user"]
      );

  Map<String, dynamic> toJon() => {
    "id": id,
    "idUser": idUser,
    "longitude": longitude,
    "latitude": latitude,
    "svgLink": svgLink,
    "user": json
  };
}