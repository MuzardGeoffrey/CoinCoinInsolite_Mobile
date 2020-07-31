
import 'package:coincoins_insolites_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  @override
  void initState() {
    super.initState();
    takePhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          onPressed: takePhoto,
          child: Text("Prendre une photo",),
        ),
      ),
      );
  }

  Future<PickedFile> takePhoto() async{
    try{
      Future<PickedFile> file = ImagePicker().getImage(source: ImageSource.camera);
      return file;
    } on PlatformException catch(e){
      print(e);
      Fluttertoast.showToast(msg: AppLocalizations.of(context).translate('CameraText'), backgroundColor: Colors.grey);
      return null;
    }
  }
}