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
    final triangleBaseWidth = size.width * 1.5; // Make the base longer

    // Define the three points of the upside-down triangle
    final point1 = Offset(center.dx,
        center.dy + triangleHeight / 2); // Bottom vertex (now at the top)
    final point2 = Offset(center.dx - triangleBaseWidth / 2,
        center.dy - triangleHeight / 2); // Top left vertex
    final point3 = Offset(center.dx + triangleBaseWidth / 2,
        center.dy - triangleHeight / 2); // Top right vertex

    // Paint for the shadow
    final shadowPaint = Paint()
      ..color = shadowColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlurRadius);

    // Draw the shadow lines
    _drawLine(canvas, point1, point2, shadowPaint); // Bottom to top left
    _drawLine(canvas, point2, point3, shadowPaint); // Top left to top right
    _drawLine(canvas, point3, point1, shadowPaint); // Top right to bottom

    // Paint for the actual triangle lines
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw the actual triangle lines
    _drawLine(canvas, point1, point2, linePaint); // Bottom to top left
    _drawLine(canvas, point2, point3, linePaint); // Top left to top right
    _drawLine(canvas, point3, point1, linePaint); // Top right to bottom
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
