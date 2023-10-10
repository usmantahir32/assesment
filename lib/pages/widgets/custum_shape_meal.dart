import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7680356, size.height * 0.5368584);
    path_0.arcToPoint(Offset(size.width * 0.7671171, size.height * 0.5398434),
        radius: Radius.elliptical(
            size.width * 0.02932494, size.height * 0.02932494),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.7410943, size.height * 0.5579829),
        radius: Radius.elliptical(
            size.width * 0.02783791, size.height * 0.02783791),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.2596930, size.height * 0.5579829);
    path_0.arcToPoint(Offset(size.width * 0.2319644, size.height * 0.5302543),
        radius: Radius.elliptical(
            size.width * 0.02776138, size.height * 0.02776138),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.2319644, size.height * 0.4697785);
    path_0.arcToPoint(Offset(size.width * 0.2596930, size.height * 0.4420499),
        radius: Radius.elliptical(
            size.width * 0.02776138, size.height * 0.02776138),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.6888408, size.height * 0.4420499);
    path_0.arcToPoint(Offset(size.width * 0.6832426, size.height * 0.4504472),
        radius: Radius.elliptical(
            size.width * 0.009129874, size.height * 0.009129874),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.6832426, size.height * 0.5314461);
    path_0.arcToPoint(Offset(size.width * 0.6923397, size.height * 0.5405432),
        radius: Radius.elliptical(
            size.width * 0.009108006, size.height * 0.009108006),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.7607536, size.height * 0.5405432);
    path_0.arcToPoint(Offset(size.width * 0.7680356, size.height * 0.5368584),
        radius: Radius.elliptical(
            size.width * 0.009108006, size.height * 0.009108006),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
