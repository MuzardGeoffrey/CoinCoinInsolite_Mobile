import 'dart:convert';
import 'package:coincoins_insolites_mobile/api/conf_api.dart';
import 'package:coincoins_insolites_mobile/i18n/app_localizations.dart';
import 'package:coincoins_insolites_mobile/model/model_user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class CreateUser{

  Future<UserModel> createUser(String pseudonym, String mail, String password, BuildContext context) async{
    final String apiUrl = apiUsers;

    final response = await http.post(
      apiUrl, 
      headers: headers,
      body: jsonEncode({
        "mail": mail,
        "password": password,
        "pseudonym": pseudonym
      }));

    if(response.statusCode == 200){
      final String responseString = response.body;

      return userModelFromJson(responseString);
    }else if(response.statusCode == 400){

      if(jsonDecode(response.body) is Map<String, dynamic>){
        Map<String, dynamic> toast = jsonDecode(response.body);

        toast.forEach((k,v) => Fluttertoast.showToast(
        msg: AppLocalizations.of(context).translate('Mail_Unique'),
        backgroundColor: Colors.grey[500],
        textColor: Colors.white,
        timeInSecForIosWeb: 3,
      ));
      }else{
        Fluttertoast.showToast(
          msg: "Une erreur est survenue",
          backgroundColor: Colors.grey[500],
          textColor: Colors.white,
          timeInSecForIosWeb: 3,
        );
      }
      return null;
    }
  }
}