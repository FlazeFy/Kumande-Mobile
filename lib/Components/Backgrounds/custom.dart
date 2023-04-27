import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Customable paint path
    var paint = Paint()..strokeWidth = 15;

    final gradientColors = [
      secondaryBg,
      primaryBg,
    ];

    final gradientStops = [
      0.0,
      1.0,
    ];

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: gradientColors,
      stops: gradientStops,
    );

    final shader =
        gradient.createShader(Rect.fromLTRB(0, 0, size.width, size.height));
    paint.shader = shader;

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, size.width, size.height));
    paint.color = primaryBg;
    canvas.drawPath(mainBackground, paint);

    //Color attribute
    var paint1 = Paint()..shader = shader;
    var paint2 = Paint()..color = whiteBg;

    //Right circle
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.06), 50, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.8, size.height * 0.06), 48.5, paint1);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.06), 44, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.8, size.height * 0.06), 42.5, paint1);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.06), 38, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.8, size.height * 0.06), 36.5, paint1);

    //Left circle
    canvas.drawCircle(Offset(size.width * 0.07, size.height * 0.2), 50, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.07, size.height * 0.2), 48.5, paint1);
    canvas.drawCircle(Offset(size.width * 0.07, size.height * 0.2), 44, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.07, size.height * 0.2), 42.5, paint1);
    canvas.drawCircle(Offset(size.width * 0.07, size.height * 0.2), 38, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.07, size.height * 0.2), 36.5, paint1);

    //Mini circle
    canvas.drawCircle(
        Offset(size.width * 0.95, size.height * 0.27), 40, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.95, size.height * 0.27), 38.5, paint1);
    canvas.drawCircle(
        Offset(size.width * 0.95, size.height * 0.27), 34, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.95, size.height * 0.27), 32.5, paint1);
    canvas.drawCircle(
        Offset(size.width * 0.95, size.height * 0.27), 28, paint2);
    canvas.drawCircle(
        Offset(size.width * 0.95, size.height * 0.27), 26.5, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
