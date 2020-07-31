import 'dart:convert';
import 'package:coincoins_insolites_mobile/api/conf_api.dart';
import 'package:http/http.dart' as http;
import 'package:coincoins_insolites_mobile/model/model_user.dart';

class AuthenticateUser{

  Future<UserModel> authenticateUser(String mail, String password) async{
    final String apiUrl = apiAuthenticate;

    final response = await http.post(
      apiUrl, 
      headers: headers,
      body: jsonEncode({
        "mail": mail,
        "password": password
        })); 

    if(response.statusCode == 200){
      final String responseString = response.body;
      return userModelFromJson(responseString);
    }else if(response.statusCode == 400){

      if(jsonDecode(response.body) is Map<String, dynamic>)
      print(response.statusCode);
      print(response.request);
      print(response.body);
      return null;
    }
  }
}