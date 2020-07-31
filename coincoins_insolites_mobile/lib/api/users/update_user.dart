import 'dart:convert';
import 'package:coincoins_insolites_mobile/api/conf_api.dart';
import 'package:coincoins_insolites_mobile/library/widgets/constants.dart';
import 'package:http/http.dart' as http;
import 'package:coincoins_insolites_mobile/model/model_user.dart';

class UpdateUser{

  Future<UserModel> updateUser(Map<String, dynamic> map) async{
    final String apiUrl = apiUsers;

    final response = await http.post(
      "$apiUrl/${me.id}", 
      headers: headers,      
      body: jsonEncode(map));

    if(response.statusCode == 200){
      final String responseString = response.body;
      
      return userModelFromJson(responseString);
    }else{
      print(response.statusCode);
      print(response.request);
      print(response.body);
      return null;
    }
  }
}