import 'package:custom_loadings/widgets/dotted_circle.dart';
import 'package:custom_loadings/widgets/triangle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            DottedCircle(
              dotCount: 5,
              radius: 220,
              dotColor: Colors.red,
              strokeWidth: 10,
              shadowColor: Colors.red,
              shadowBlurRadius: 10.0,
              gapRatio: 0.2,
              rotatingRight: false,
            ),
            DottedCircle(
              dotCount: 8,
              radius: 180,
              dotColor: Colors.blue,
              strokeWidth: 10,
              shadowColor: Colors.blue,
              shadowBlurRadius: 10.0,
              gapRatio: 0.2,
              rotatingRight: false,
            ),
            DottedCircle(
              dotCount: 10,
              radius: 140,
              dotColor: Colors.blue,
              strokeWidth: 10,
              shadowColor: Colors.blue,
              shadowBlurRadius: 10.0,
              gapRatio: 0.2,
              rotatingRight: true,
            ),
            DottedCircle(
              dotCount: 8,
              radius: 100,
              dotColor: Colors.red,
              strokeWidth: 30,
              shadowColor: Colors.red,
              shadowBlurRadius: 10.0,
              gapRatio: 0.9,
              rotatingRight: false,
            ),
            Positioned(
              top: 170,
              child: TriangleWidget(
                lineColor: const Color.fromARGB(255, 0, 170, 255),
                strokeWidth: 10,
                shadowColor: const Color.fromARGB(255, 0, 170, 255),
                shadowBlurRadius: 10,
                radius: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
