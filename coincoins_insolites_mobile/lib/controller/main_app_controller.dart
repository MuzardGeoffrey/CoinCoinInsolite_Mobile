import 'package:coincoins_insolites_mobile/page/gallery.dart';
import 'package:coincoins_insolites_mobile/page/place.dart';
import 'package:coincoins_insolites_mobile/page/profil.dart';
import 'package:coincoins_insolites_mobile/page/photo.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//Page containing the Menu in the form of a bar with icons as a button

class MainAppController extends StatefulWidget{

  _MainState createState() => _MainState();
}

class _MainState extends State<MainAppController>{

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  int _page = 0;

  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        items: <Widget>[
          Icon(Icons.account_circle, size: 30.0,),
          Icon(Icons.location_on, size: 30.0,),
          Icon(Icons.add_a_photo, size: 30.0,),
          Icon(Icons.photo_library, size: 30.0,),
        ],
        onTap: (index){
          setState(() {
            _page = index;
          });
        },
        height: 55.0,
        animationDuration: Duration(milliseconds: 400),
      ),
      body: _pageChooser(),
    );
  }

  Widget _pageChooser(){
    switch(_page){
      //Profil Page
      case 0:
        return ProfilPage();
      //Insolite Page
      case 1:
        return PlacePage();
      //Prendre une photo
      case 2:
        return PhotoPage();  
      //Gallery Photo Page
      default:
        return GalleryPage();
    }
  }
}