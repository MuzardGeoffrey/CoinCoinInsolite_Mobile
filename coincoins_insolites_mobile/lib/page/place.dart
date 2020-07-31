import 'package:coincoins_insolites_mobile/api/places/get_places.dart';
import 'package:coincoins_insolites_mobile/i18n/app_localizations.dart';
import 'package:coincoins_insolites_mobile/library/widgets/padding_with_child.dart';
import 'package:coincoins_insolites_mobile/library/widgets/text_widget.dart';
import 'package:coincoins_insolites_mobile/model/model_place.dart';

import 'package:coincoins_insolites_mobile/page/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart';
import 'dart:async';


class PlacePage extends StatefulWidget {
  PlaceState createState() => PlaceState();
}

class PlaceState extends State<PlacePage> {

  Stream<LocationData> stream;
  Location location;
  LocationData locationData;
  List<PlaceModel> place;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(AppLocalizations.of(context).translate('PlaceText'), fontSize: 20.0,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
              child: Column(
            children: <Widget>[
              //Gestion du filtrage de distance
              PaddingWith(
                top: 20.0,
                widget: Row(
                  children: <Widget>[
                    PaddingWith(
                      top: 0.0,
                      left: 10.0,
                      widget: MyText(
                        "Distance",
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: CustomRadioButton(
                        buttonColor: Colors.indigo[300],
                        buttonLables: ["200m", "1km", "3km", "10km"],
                        buttonValues: ["200m", "1km", "3km", "10km"],
                        radioButtonValue: (value) => print(value),
                        selectedColor: Theme.of(context).accentColor,
                      ),
                    )
                  ],
                ),
              ),
              //Affichage des lieu
              PaddingWith(
                top: 60.0,
                widget: FutureBuilder(
                    future: GetPlaces().getPlaces(),
                    builder: (context, snapshot) {
                      return snapshot.data != null
                          ? listViewWidget(snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    }))
            ]
          ))
        )
      ));
  }

  Widget listViewWidget(List<PlaceModel> placeModel) {
    return ListView.builder(itemBuilder: (context, index) {
      return RaisedButton(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: MyText(
                placeModel[index].title,
                color: Colors.black,
              ),
            ),
            Container(
              height: 100.0,
              width: 150.0,
              child: SvgPicture.asset("assets/snowflakes_dark.svg"),
            ),
            MyText(
              "distance",
              color: Colors.black,
            ),
          ],
        ),
        onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context)=> new MapPage())),
      );
    },itemCount: 10);
  }

  getLocation() async{
    location = new Location();
    try{
      locationData = await location.getLocation();
      await location.changeSettings(accuracy: LocationAccuracy.high, interval: 5000);
    }catch(e) {
      print("Impossible de récupérer la géolocalisation: $e");
    }
  }
}