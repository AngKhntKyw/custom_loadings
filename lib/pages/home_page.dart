import 'dart:async';
import 'package:custom_loadings/pages/projects_page.dart';
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
              right: !topLeft ? -1000 : 10,
              bottom: 10,
              duration: const Duration(seconds: 1),
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 80,
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: const Size(200, 80),
                          painter: FolderIconPainter(),
                        ),
                        const Center(
                          child: Text(
                            "About me",
                            style: TextStyle(
                              color: Color.fromARGB(255, 112, 236, 255),
                              shadows: [
                                Shadow(
                                  color: Colors.blue,
                                  blurRadius: 3,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 40),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProjectsPage()));
                    },
                    child: SizedBox(
                      width: 200,
                      height: 80,
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: const Size(200, 80),
                            painter: FolderIconPainter(),
                          ),
                          const Center(
                            child: Text(
                              "Projects",
                              style: TextStyle(
                                color: Color.fromARGB(255, 112, 236, 255),
                                shadows: [
                                  Shadow(
                                    color: Colors.blue,
                                    blurRadius: 3,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 40),
                  SizedBox(
                    width: 200,
                    height: 80,
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: const Size(200, 80),
                          painter: FolderIconPainter(),
                        ),
                        const Center(
                          child: Text(
                            "Experiences",
                            style: TextStyle(
                              color: Color.fromARGB(255, 112, 236, 255),
                              shadows: [
                                Shadow(
                                  color: Colors.blue,
                                  blurRadius: 3,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 40),
                  SizedBox(
                    width: 200,
                    height: 80,
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: const Size(200, 80),
                          painter: FolderIconPainter(),
                        ),
                        const Center(
                          child: Text(
                            "Documents",
                            style: TextStyle(
                              color: Color.fromARGB(255, 112, 236, 255),
                              shadows: [
                                Shadow(
                                  color: Colors.blue,
                                  blurRadius: 3,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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

class FolderIcon extends StatelessWidget {
  const FolderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 60), // Folder size
      painter: FolderIconPainter(),
    );
  }
}

class FolderIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.fromARGB(79, 112, 236, 255)
      ..style = PaintingStyle.fill;

    // Border color and width
    final Paint borderPaint = Paint()
      ..color = Color.fromARGB(255, 112, 236, 255) // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4; // Thickness of the border

    // Shadow paint (using a mask filter to create blur)
    final Paint shadowPaint = Paint()
      ..color = Colors.black
          .withValues(blue: 0.1) // Shadow color (semi-transparent black)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5); // Blur effect

    final Paint highlightPaint = Paint()
      ..color = Colors.blue // Slanted edge highlight color
      ..style = PaintingStyle.fill;

    // Main folder body (rectangle with slanted top)
    final folderPath = Path()
      ..moveTo(20, size.height) // Start at bottom left
      ..lineTo(size.width - 20, size.height) // Bottom right
      ..lineTo(size.width - 20, 15) // Top right (shortened)
      ..lineTo(50, 0) // Slanted top-left corner
      ..lineTo(20, 15) // Left corner (shortened)
      ..close();

    // Draw the shadow of the folder body first (slightly offset)
    canvas.drawPath(folderPath, shadowPaint);

    // Draw the folder background (grey color)
    canvas.drawPath(folderPath, paint);

    // Draw the folder highlight (orange slanted edge)
    final highlightPath = Path()
      ..moveTo(50, 0) // Start of slanted highlight edge
      ..lineTo(size.width - 20, 15) // Top-right (shortened)
      ..lineTo(size.width - 20, 0) // Top-right horizontal end
      ..lineTo(50, 0) // End of slanted edge
      ..close();

    canvas.drawPath(highlightPath, highlightPaint);

    // Draw the folder border (orange border)
    canvas.drawPath(folderPath, borderPaint);

    // Optional: Draw the folder outline (stronger black border)
    final outlinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Outline thickness
    canvas.drawPath(folderPath, outlinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
