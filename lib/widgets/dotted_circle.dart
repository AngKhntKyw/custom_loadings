import 'package:flutter/material.dart';

class DottedCircle extends StatefulWidget {
  final int dotCount;
  final double radius;
  final Color dotColor;
  final double strokeWidth;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double gapRatio;
  final bool rotatingRight;

  const DottedCircle({
    super.key,
    required this.dotCount,
    required this.radius,
    this.dotColor = Colors.blue,
    this.strokeWidth = 3.0,
    this.shadowColor = Colors.blue,
    this.shadowBlurRadius = 10.0,
    this.gapRatio = 0.2,
    required this.rotatingRight,
  });

  @override
  State<DottedCircle> createState() => _DottedCircleState();
}

class _DottedCircleState extends State<DottedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    )..repeat();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _controller.value * 2 * 3.1416 * (widget.rotatingRight ? 1 : -1),
      child: CustomPaint(
        size: Size(widget.radius * 2, widget.radius * 2),
        painter: DottedCirclePainter(
          dotCount: widget.dotCount,
          radius: widget.radius,
          dotColor: widget.dotColor,
          strokeWidth: widget.strokeWidth,
          shadowColor: widget.shadowColor,
          shadowBlurRadius: widget.shadowBlurRadius,
          gapRatio: widget.gapRatio,
        ),
      ),
    );
  }
}

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
