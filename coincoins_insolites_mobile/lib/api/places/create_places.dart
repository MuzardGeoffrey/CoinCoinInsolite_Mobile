import 'dart:convert';

import 'package:coincoins_insolites_mobile/api/conf_api.dart';
import 'package:coincoins_insolites_mobile/model/model_place.dart';
import 'package:http/http.dart' as http;

class CreatePlaces{

  Future<PlaceModel> createPlaces() async{
    final String apiUrl = apiPlaces;

    final response = await http.post(
      apiUrl,
      headers: headers,
      body: jsonEncode({

      }));

    if(response.statusCode == 200){
      final String responseString = response.body;
      
      return placeModelFromJson(responseString);
    }else{
      print(response.statusCode);
      print(response.request);
      print(response.body);
      return null;
    }
  }
}