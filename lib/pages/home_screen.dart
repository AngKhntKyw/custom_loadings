import 'package:custom_loadings/widgets/dotted_circle.dart';
import 'package:custom_loadings/widgets/triangle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool startApp = false;
  bool startMenu = false;

  //
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    //
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 0, 0, 0),
              const Color.fromARGB(79, 16, 38, 42),
              const Color.fromARGB(79, 16, 43, 48),
              const Color.fromARGB(79, 29, 83, 91),
              const Color.fromARGB(79, 112, 236, 255),
            ],
          ),
          border: Border.all(
            color: Color.fromARGB(255, 112, 236, 255),
            width: size.height / 200,
          ),
        ),
        child: Stack(
          children: [
            // Ironman Pic
            AnimatedAlign(
              curve: Curves.decelerate,
              duration: const Duration(seconds: 2),
              alignment:
                  startApp ? Alignment.center : Alignment(0, size.height / 2),
              child: Image.network(
                "assets/wallpaperflare.com_wallpaper-ai-brush-removebg-248btz7s.png",
                height: size.height / 1.02,
                width: size.height / 1.02,
              ),
            ),

            // Time
            AnimatedAlign(
              curve: Curves.decelerate,
              duration: const Duration(seconds: 2),
              alignment: startApp ? Alignment.topRight : Alignment(0, -100),
              child: Text(
                DateTime.now().toString(),
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

            // Arc Reactor
            AnimatedPositioned(
              curve: Curves.linear,
              duration: const Duration(seconds: 2),
              top: startApp
                  ? size.height / 40
                  : size.height / 2 - (size.height / 10),
              left: startApp
                  ? size.width / 80
                  : size.width / 2 - (size.height / 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                splashColor: Color.fromARGB(255, 98, 147, 155),
                onTap: () {
                  setState(() {
                    startApp = !startApp;
                    startMenu = false;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    DottedCircle(
                      dotCount: 6,
                      radius: size.height / 10,
                      dotColor: Colors.white,
                      strokeWidth: size.height / 200,
                      shadowColor: Colors.white,
                      shadowBlurRadius: 10.0,
                      gapRatio: 0.2,
                      rotatingRight: false,
                    ),
                    DottedCircle(
                      dotCount: 4,
                      radius: size.height / 12,
                      dotColor: Color.fromARGB(255, 112, 236, 255),
                      strokeWidth: size.height / 200,
                      shadowColor: Color.fromARGB(255, 112, 236, 255),
                      shadowBlurRadius: 10.0,
                      gapRatio: 0.2,
                      rotatingRight: false,
                    ),
                    DottedCircle(
                      dotCount: 8,
                      radius: size.height / 14,
                      dotColor: Colors.blue,
                      strokeWidth: size.height / 300,
                      shadowColor: Colors.blue,
                      shadowBlurRadius: 10.0,
                      gapRatio: 0.2,
                      rotatingRight: false,
                    ),
                    DottedCircle(
                      dotCount: 4,
                      radius: size.height / 18,
                      dotColor: Color.fromARGB(255, 112, 236, 255),
                      strokeWidth: size.height / 200,
                      shadowColor: Color.fromARGB(255, 112, 236, 255),
                      shadowBlurRadius: 10.0,
                      gapRatio: 0.2,
                      rotatingRight: false,
                    ),
                    DottedCircle(
                      dotCount: 10,
                      radius: size.height / 25,
                      dotColor: Colors.red,
                      strokeWidth: size.height / 200,
                      shadowColor: Colors.red,
                      shadowBlurRadius: 10.0,
                      gapRatio: 0.6,
                      rotatingRight: false,
                    ),
                    TriangleWidget(
                      lineColor: Color.fromARGB(255, 112, 236, 255),
                      strokeWidth: size.height / 200,
                      shadowColor: Color.fromARGB(255, 112, 236, 255),
                      shadowBlurRadius: 10,
                      radius: size.height / 80,
                    ),
                  ],
                ),
              ),
            ),

            // Menu Container
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(800),
                ),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  alignment: Alignment.topRight,
                  curve: Curves.linear,
                  height: startMenu ? size.height : 0,
                  width: startMenu ? size.width / 1.2 : 0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 1, 50, 56),
                    border: Border.all(
                      color: Color.fromARGB(255, 112, 236, 255),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(800),
                    ),
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 50,
                    shrinkWrap: true,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: startMenu ? size.width / 20 : 0,
                            width: startMenu ? size.width / 20 : 0,
                            child: Image.network(
                              "assets/icons8-folder-144.png",
                            ),
                          ),
                          // Text(
                          //   "Menu Item $index",
                          //   style: TextStyle(
                          //     color: Color.fromARGB(255, 112, 236, 255),
                          //     fontSize: size.width / 120,
                          //   ),
                          // ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),

            // Menu Button
            AnimatedAlign(
              curve: Curves.decelerate,
              duration: const Duration(seconds: 2),
              alignment: startApp ? Alignment.bottomRight : Alignment(0, 100),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                splashColor: Color.fromARGB(255, 98, 147, 155),
                onTap: () {
                  setState(() {
                    startMenu = !startMenu;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    DottedCircle(
                      dotCount: 12,
                      radius: size.height / 12,
                      dotColor: Color.fromARGB(255, 112, 236, 255),
                      strokeWidth: size.height / 300,
                      shadowColor: Colors.white,
                      shadowBlurRadius: 10.0,
                      gapRatio: 0.2,
                      rotatingRight: false,
                    ),
                    DottedCircle(
                      dotCount: 6,
                      radius: size.height / 14,
                      dotColor: Color.fromARGB(255, 112, 236, 255),
                      strokeWidth: size.height / 200,
                      shadowColor: Colors.white,
                      shadowBlurRadius: 10.0,
                      gapRatio: 0.2,
                      rotatingRight: false,
                    ),
                    DottedCircle(
                      dotCount: 3,
                      radius: size.height / 18,
                      dotColor: Colors.white,
                      strokeWidth: size.height / 100,
                      shadowColor: Colors.white,
                      shadowBlurRadius: 10.0,
                      gapRatio: 0.2,
                      rotatingRight: false,
                    ),
                    DottedCircle(
                      dotCount: 6,
                      radius: size.height / 24,
                      dotColor: Colors.red,
                      strokeWidth: size.height / 200,
                      shadowColor: Colors.white,
                      shadowBlurRadius: 10.0,
                      gapRatio: 0.2,
                      rotatingRight: false,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 112, 236, 255),
                      radius: size.height / 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
