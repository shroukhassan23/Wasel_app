import 'dart:ui';

import 'package:flutter/material.dart';

class BoundingBoxPainter extends CustomPainter {
  final List<Rect> boundingBoxes;
  BoundingBoxPainter(this.boundingBoxes);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    for (var box in boundingBoxes) {
      canvas.drawRect(box, paint);
    }
  }

  @override
  bool shouldRepaint(BoundingBoxPainter oldDelegate) {
    return oldDelegate.boundingBoxes != boundingBoxes;
  }
}
