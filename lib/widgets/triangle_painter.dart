import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color lineColor; // Color of the triangle lines
  final double strokeWidth; // Width of the triangle lines
  final Color shadowColor; // Color of the shadow
  final double shadowBlurRadius; // Blur radius of the shadow

  TrianglePainter({
    this.lineColor = Colors.blue,
    this.strokeWidth = 3.0,
    this.shadowColor = Colors.black,
    this.shadowBlurRadius = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final triangleHeight = size.height;
    final triangleWidth = size.width;

    // Define the three points of the triangle
    final point1 = Offset(center.dx, center.dy - triangleHeight / 2); // Top
    final point2 = Offset(center.dx - triangleWidth / 2,
        center.dy + triangleHeight / 2); // Bottom left
    final point3 = Offset(center.dx + triangleWidth / 2,
        center.dy + triangleHeight / 2); // Bottom right

    // Paint for the shadow
    final shadowPaint = Paint()
      ..color = shadowColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlurRadius);

    // Draw the shadow lines
    _drawLine(canvas, point1, point2, shadowPaint); // Top to bottom left
    _drawLine(
        canvas, point2, point3, shadowPaint); // Bottom left to bottom right
    _drawLine(canvas, point3, point1, shadowPaint); // Bottom right to top

    // Paint for the actual triangle lines
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw the actual triangle lines
    _drawLine(canvas, point1, point2, linePaint); // Top to bottom left
    _drawLine(canvas, point2, point3, linePaint); // Bottom left to bottom right
    _drawLine(canvas, point3, point1, linePaint); // Bottom right to top
  }

  // Helper method to draw a line between two points
  void _drawLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
