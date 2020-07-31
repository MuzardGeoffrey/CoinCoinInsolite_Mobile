import 'dart:convert';

import 'package:coincoins_insolites_mobile/model/model_pictureUser.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String mail;
  String password;
  String pseudonym;
  List<PictureUserModel> listPictureUser;

  UserModel({
    this.id,
    this.mail,
    this.password,
    this.pseudonym,
    this.listPictureUser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    mail: json["mail"],
    password: json["password"],
    pseudonym: json["pseudonym"],
    listPictureUser: json["listPictureUser"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mail": mail,
    "password": password,
    "pseudonym": pseudonym,
    "listPictureUser": listPictureUser,
  };
}