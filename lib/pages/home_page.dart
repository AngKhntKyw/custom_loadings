import 'package:custom_loadings/widgets/dotted_circle.dart';
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
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: DottedCircle(
          dotCount: 12,
          radius: 100,
          dotColor: Colors.blue,
          strokeWidth: 5,
          shadowColor: Colors.blue,
          shadowBlurRadius: 10.0,
          gapRatio: 0.2,
          rotatingRight: false,
        ),
      ),
    );
  }
}
