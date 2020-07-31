import 'dart:async';

import 'package:coincoins_insolites_mobile/api/places/create_places.dart';
import 'package:coincoins_insolites_mobile/library/material_home.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget{

  MapState createState() => MapState();
}

class MapState extends State<MapPage>{  

  Location location;
  LocationData locationData;

  BitmapDescriptor sourceIcon;

  Completer<GoogleMapController> _controller = Completer();
  static LatLng _center = LatLng(48.0495142,-1.7454319);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  final CameraPosition _position = CameraPosition(
    bearing: 0.0,
    target: _center,
    zoom: 11.0
  );

  //Fonction utilisé pour trouvé ma position
  Future<void> _goToPosition() async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position));
  }

  //Fonction pour faire bouger la camera sur ma dernière position en appuyant sur le bouton de position
  _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }

  //Fonction pour changer de type de map 
  _onMapTypeButtonPressed(){
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
       ? MapType.satellite
       : MapType.normal;
    });
  }

  //Fonction pour ajouter un pin sur ma position
  _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: "This is a title",
          snippet: "This is a snippet",
        ),
        icon: sourceIcon,
      ));
    });
  }

  //Fonction pour ajouter un bouton flottant
  Widget button(Function function, IconData icon, String heroTag){
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(icon, size: 36.0),
    );
  }

  @override
  void initState() {
    super.initState();
    location = new Location();

    location.onLocationChanged.listen((LocationData cLoc){
      locationData = cLoc;
      _onAddMarkerButtonPressed();
    });

    //setCustomMapPin();
  }

  createMarker(context){
    if(sourceIcon == null){
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, "assets/icon_duck.png").then((icon){
        setState(){
          sourceIcon = icon;
        }
      });
      CreatePlaces().createPlaces();
    }
  }

  @override
  Widget build(BuildContext context) {
    createMarker(context);
    return Scaffold(
      appBar: AppBar(
        title: MyText("Maps", fontSize: 20.0,),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (pos){
              print(pos);
              Marker m = Marker(markerId: MarkerId("1"), icon: sourceIcon, position: pos);
              setState(() {
                _markers.add(m);
              });
            },
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(48.0495142,-1.7454319),
              zoom: 11.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  button(_onMapTypeButtonPressed, Icons.map, "btnMap"),
                  SizedBox(height: 16.0),
                  button(_onAddMarkerButtonPressed, Icons.add_location, "btnAddLocation"),
                  SizedBox(
                    height: 16.0,
                  ),
                  button(_goToPosition, Icons.location_searching, "btnLocation"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}