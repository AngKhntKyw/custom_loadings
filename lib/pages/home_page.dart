import 'dart:async';
import 'package:custom_loadings/widgets/arc_reactor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  //
  double _turns = 0.0;
  late Timer _timer;
  //
  String _formattedTime = DateFormat('hh:mm a').format(DateTime.now());

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _radiusAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _startRotation();
    _updateTime();

    _controller.forward();
  }

  void _updateTime() {
    // Updates time every second
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _formattedTime = DateFormat('hh:mm a').format(DateTime.now());
        });
        _updateTime();
      }
    });
  }

  void onTap() {
    _controller.animateBack(_radiusAnimation.value == 0 ? 20 : 0);

    setState(() {
      topLeft = !topLeft;
    });
  }

  void _startRotation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _turns += 0.02;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            //
            AnimatedPositioned(
              top: topLeft ? size.height / 10 : size.height + 10,
              right: 0,
              left: 0,
              duration: const Duration(seconds: 1),
              child: Image.network(
                "assets/wallpaperflare.com_wallpaper.jpg",
                height: size.height / 1.5,
                width: size.height / 1.5,
              ),
            ),

            //
            AnimatedPositioned(
              right: 10,
              bottom: !topLeft ? -1000 - (_radiusAnimation.value + 80) : 20,
              duration: const Duration(seconds: 1),
              child: CustomPaint(
                size: const Size(150, 150),
                painter: FolderIconPainter(),
              ),
            ),

            //

            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              left: 10,
              bottom: !topLeft ? -1000 - (_radiusAnimation.value + 80) : 20,
              child: AnimatedRotation(
                duration: const Duration(seconds: 1),
                turns: _turns,
                curve: Curves.bounceIn,
                child: ClipOval(
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    "assets/pxfuel.jpg",
                    fit: BoxFit.cover,
                    width: size.height / 3,
                    height: size.height / 3,
                  ),
                ),
              ),
            ),

            //
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              left: !topLeft
                  ? (size.width / 2) - (_radiusAnimation.value + 80)
                  : 10,
              top: !topLeft
                  ? (size.height / 2) - (_radiusAnimation.value + 80)
                  : 20,
              child: AnimatedBuilder(
                animation: _radiusAnimation,
                builder: (context, child) {
                  return ArcReactor(
                    radius: _radiusAnimation.value,
                  );
                },
              ),
            ),

            //

            //
            AnimatedPositioned(
              top: 20,
              right: topLeft ? 10 : -1000,
              duration: const Duration(seconds: 1),
              child: Row(
                children: [
                  SizedBox(width: size.width / 40),
                  Text(
                    _formattedTime,
                    style: const TextStyle(
                      fontFamily: 'Digital',
                      fontSize: 40,
                      color: Color.fromARGB(255, 112, 236, 255),
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 112, 236, 255),
                          blurRadius: 0.1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}

class FolderIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final Paint outlinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Folder shape (rounded rectangle)
    final folderRect = Rect.fromLTWH(20, 30, size.width - 40, size.height - 60);
    final folderPath = Path()
      ..moveTo(folderRect.left + 10, folderRect.top) // Left side top
      ..lineTo(folderRect.right - 10, folderRect.top) // Right side top
      ..lineTo(folderRect.right - 10, folderRect.bottom) // Right side bottom
      ..lineTo(folderRect.left + 10, folderRect.bottom) // Left side bottom
      ..close();

    // Draw the folder background
    canvas.drawPath(folderPath, paint);

    // Draw the folder outline
    canvas.drawPath(folderPath, outlinePaint);

    // Folder tab (Top part of the folder)
    final tabPath = Path()
      ..moveTo(folderRect.left, folderRect.top)
      ..lineTo(folderRect.left + 40, folderRect.top)
      ..lineTo(folderRect.left + 10, folderRect.top - 20)
      ..close();

    paint.color = Colors.orange; // Different color for tab
    canvas.drawPath(tabPath, paint);

    // Outline for the tab
    outlinePaint.color = Colors.black;
    canvas.drawPath(tabPath, outlinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // No need to repaint, static icon
  }
}
