import 'package:flutter/material.dart';
import 'package:coincoins_insolites_mobile/library/material_home.dart';

//Class utilisé pour l'affichage du menu avec les 2 items Create et Login

class Menu2Items extends StatelessWidget {
  final String item1;
  final String item2;
  final PageController pageController;

  Menu2Items(
      {@required this.item1,
        @required this.item2,
        @required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.0,
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: CustomPaint(
          painter: MyPainter(pageController),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              itemButton(item1),
              itemButton(item2),
            ],
          ),
        )
    );
  }

  Expanded itemButton(String name) {
    return Expanded(
      child: FlatButton(
          onPressed: () {
            int page = (pageController.page == 0.0) ? 1 : 0;
            pageController.animateToPage(
                page,
                duration: Duration(milliseconds: 300),
                curve: Curves.decelerate);
          },
          child: Text(name)),
    );
  }
}