import 'package:coincoins_insolites_mobile/api/conf_api.dart';
import 'package:coincoins_insolites_mobile/model/model_place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetPlaces{

  List<PlaceModel> list;

  Future<List<PlaceModel>> getPlaces() async{
    final String apiUrl = apiUsers;

    final response = await http.get(apiUrl);

    if(response.statusCode == 200){
      final String responseString = response.body;

      var data = json.decode(responseString);

      var rest = data["places"] as List;

      list = rest.map<PlaceModel>((json) => PlaceModel.fromJson(json)).toList();

      return list;
    }else{
      print(response.statusCode);
      print(response.request);
      print(response.body);
      return null;
    }
  }
}