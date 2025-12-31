import 'package:flutter/cupertino.dart';

class AirplanePainter extends CustomPainter {
  final Color fillColor;

  AirplanePainter(this.fillColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final path = Path();

    // Simple airplane shape
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.6, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.6, size.height * 0.6);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width * 0.4, size.height * 0.6);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.4, size.height * 0.4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant AirplanePainter oldDelegate) {
    return oldDelegate.fillColor != fillColor;
  }
}
