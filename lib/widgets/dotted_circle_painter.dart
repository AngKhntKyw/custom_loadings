import 'package:flutter/material.dart';

class DottedCirclePainter extends CustomPainter {
  final int dotCount;
  final double radius;
  final Color dotColor;
  final double strokeWidth;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double gapRatio;

  DottedCirclePainter({
    required this.dotCount,
    required this.radius,
    this.dotColor = Colors.blue,
    this.strokeWidth = 3.0,
    this.shadowColor = Colors.blue,
    this.shadowBlurRadius = 10.0,
    this.gapRatio = 0.2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Calculate the circumference of the circle
    final circumference = 2 * 3.1416 * radius;

    // Calculate the length of each dot and gap based on the gap ratio
    final totalSegments = dotCount; // Each segment is a dot + a gap
    final segmentLength = circumference / totalSegments;
    final dotLength = dotCount == 1
        ? circumference
        : segmentLength * (1 - gapRatio); // Dot length
    final gapLength = segmentLength * gapRatio; // Gap length

    // Paint for the shadow (neon effect)
    final shadowPaint = Paint()
      ..color = shadowColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlurRadius);

    // Draw the shadow (neon effect)
    for (int i = 0; i < dotCount; i++) {
      final startAngle = (i * (dotLength + gapLength)) / radius;
      final sweepAngle = dotLength / radius;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        shadowPaint,
      );
    }

    // Paint for the actual dotted lines
    final dotPaint = Paint()
      ..color = dotColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw the actual dotted lines
    for (int i = 0; i < dotCount; i++) {
      final startAngle = (i * (dotLength + gapLength)) / radius;
      final sweepAngle = dotLength / radius;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
