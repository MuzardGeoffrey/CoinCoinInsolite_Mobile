import 'package:coincoins_insolites_mobile/model/model_user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Colors
const Color orangeSalmon = Color(0xFFF27649);

const Color orangePin = Color(0xFFF47643);

UserModel me;

bool darkMode;

//Image

AssetImage logoDuck = AssetImage("assets/icon_duck.png");

const List<String> assetSVG = <String>[
  'assets/snowflakes_dark.svg',
  'assets/snowflakes_dark.svg',
];

//Icon
Icon profilIcon = Icon(Icons.account_circle);
Icon cameraIcon = Icon(Icons.camera_enhance);
Icon libraryIcon = Icon(Icons.photo_library);
Icon mapIcon = Icon(Icons.map);
Icon createIcon = Icon(Icons.create);

  
Future<bool> toastAuthenticate(String string){
    return Fluttertoast.showToast(
      msg: string,
      backgroundColor: Colors.grey[500],
      textColor: Colors.white,
      timeInSecForIosWeb: 3,
    );
  }