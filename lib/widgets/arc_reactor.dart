import 'package:custom_loadings/widgets/dotted_circle.dart';
import 'package:custom_loadings/widgets/triangle.dart';
import 'package:flutter/material.dart';

class ArcReactor extends StatelessWidget {
  final double radius;
  const ArcReactor({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        DottedCircle(
          dotCount: 5,
          radius: radius + 70,
          dotColor: Colors.red,
          strokeWidth: 6,
          shadowColor: Colors.red,
          shadowBlurRadius: 10.0,
          gapRatio: 0.2,
          rotatingRight: true,
        ),
        DottedCircle(
          dotCount: 8,
          radius: radius + 55,
          dotColor: Colors.blue,
          strokeWidth: 5,
          shadowColor: Colors.blue,
          shadowBlurRadius: 10.0,
          gapRatio: 0.2,
          rotatingRight: false,
        ),
        DottedCircle(
          dotCount: 8,
          radius: radius + 35,
          dotColor: Colors.blue,
          strokeWidth: 3,
          shadowColor: Colors.blue,
          shadowBlurRadius: 10.0,
          gapRatio: 0.4,
          rotatingRight: true,
        ),
        DottedCircle(
          dotCount: 8,
          radius: radius + 15,
          dotColor: Colors.red,
          strokeWidth: 8,
          shadowColor: Colors.red,
          shadowBlurRadius: 10.0,
          gapRatio: 0.9,
          rotatingRight: false,
        ),
        TriangleWidget(
          lineColor: const Color.fromARGB(255, 0, 170, 255),
          strokeWidth: 4,
          shadowColor: const Color.fromARGB(255, 0, 170, 255),
          shadowBlurRadius: 10,
          radius: radius - (radius / 3),
        ),
      ],
    );
  }
}
