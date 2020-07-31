
import 'package:coincoins_insolites_mobile/i18n/app_localizations.dart';
import 'package:coincoins_insolites_mobile/library/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GalleryPage extends StatefulWidget{

  GalleryState createState() => GalleryState();
}

class GalleryState extends State<GalleryPage>{

  final List<Widget> _painters = <Widget>[];

  @override
  void initState(){
    super.initState();
  }

  Future<String> sunriseSunsetTimes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: MyText(AppLocalizations.of(context).translate('GalleryText'), fontSize: 20.0,),
        centerTitle: true,
        ),
      body: GridView.builder(
            itemCount: 50,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0
            ),
            padding: EdgeInsets.all(10.0),
            itemBuilder: (BuildContext context, int index){
              return Container(
                child: SvgPicture.asset("assets/snowflakes_dark.svg"),
              );
            },
          ),
    );
  }
}