import 'dart:developer';
import 'package:custom_loadings/widgets/arc_reactor.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //
  //
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  bool topLeft = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _radiusAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  void onTap() {
    _controller.animateBack(_radiusAnimation.value == 0 ? 20 : 0);

    setState(() {
      topLeft = !topLeft;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(_radiusAnimation.value.toString());
    return Scaffold(
      body: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              left: !topLeft
                  ? (MediaQuery.of(context).size.width / 2) -
                      (_radiusAnimation.value + 80)
                  : 40,
              top: !topLeft
                  ? (MediaQuery.of(context).size.height / 2) -
                      (_radiusAnimation.value + 80)
                  : 40,
              child: AnimatedBuilder(
                animation: _radiusAnimation,
                builder: (context, child) {
                  return ArcReactor(
                    radius: _radiusAnimation.value,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
