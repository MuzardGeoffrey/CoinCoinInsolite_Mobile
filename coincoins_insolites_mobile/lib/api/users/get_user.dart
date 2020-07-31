import 'package:coincoins_insolites_mobile/api/conf_api.dart';
import 'package:http/http.dart' as http;
import 'package:coincoins_insolites_mobile/model/model_user.dart';

class GetUser{

  Future<UserModel> getUser() async{
    final String apiUrl = apiUsers;

    final response = await http.get(apiUrl);

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