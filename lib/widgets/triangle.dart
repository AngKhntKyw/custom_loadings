import 'package:custom_loadings/widgets/triangle_painter.dart';
import 'package:flutter/material.dart';

class TriangleWidget extends StatelessWidget {
  final Color lineColor;
  final double strokeWidth;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double radius;

  const TriangleWidget({
    super.key,
    this.lineColor = Colors.blue,
    this.strokeWidth = 3.0,
    this.shadowColor = Colors.black,
    this.shadowBlurRadius = 5.0,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: TrianglePainter(
        lineColor: lineColor,
        strokeWidth: strokeWidth,
        shadowColor: shadowColor,
        shadowBlurRadius: shadowBlurRadius,
      ),
    );
  }
}
