import 'package:custom_loadings/controller/circle_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_loadings/widgets/dotted_circle_painter.dart';

class DottedCircle extends StatelessWidget {
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
  Widget build(BuildContext context) {
    // Initialize the controller using GetX
    final DottedCircleController controller = Get.put(DottedCircleController());

    return Obx(
      () {
        final rotationAngle =
            controller.rotationAngle * (rotatingRight ? 1 : -1);

        return Transform.rotate(
          angle: rotationAngle,
          child: CustomPaint(
            size: Size(radius * 2, radius * 2),
            painter: DottedCirclePainter(
              dotCount: dotCount,
              radius: radius,
              dotColor: dotColor,
              strokeWidth: strokeWidth,
              shadowColor: shadowColor,
              shadowBlurRadius: shadowBlurRadius,
              gapRatio: gapRatio,
            ),
          ),
        );
      },
    );
  }
}
