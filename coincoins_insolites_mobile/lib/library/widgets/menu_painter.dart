import 'dart:math';

import 'package:flutter/material.dart';

//Class qui créer la forme du menu choix entre connexion et création

class MyPainter extends CustomPainter{

  Paint painter;
  //Widget qui permet de définir quelle page est visible dans une PageView
  final PageController pageController;

  //Constructeur
  MyPainter(this.pageController): super(repaint: pageController){
    painter = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
  }

  //Fonction qui permet de peindre le Widget
  @override
  void paint(Canvas canvas, Size size) {
    //Vérifier si le constructeur est différent de null
    if(pageController != null && pageController.position != null){
      final radius = 20.0;
      final dy = 25.0;
      final dxCurrent = 25.0;
      final dxTarget = 125.0;
      final position = pageController.position;
      final extent = (position.maxScrollExtent - position.minScrollExtent + position.viewportDimension);
      final offset = position.extentBefore / extent;
      bool toRight = dxCurrent < dxTarget;
      Offset entry = Offset(toRight? dxCurrent : dxTarget, dy);
      Offset target = Offset(toRight? dxTarget: dxCurrent, dy);
      Path path = Path();
      path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
      path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
      path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);
      canvas.translate(size.width * offset, 0.0);
      canvas.drawShadow(path, Colors.white, 2.5, true);
      canvas.drawPath(path, painter);
    }
  }

  //Override appelé à chaque fois qu'une nouvelle instance du CustomPainter delegate est donnée
  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;

}