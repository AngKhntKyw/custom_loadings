import 'package:flip_card_swiper/flip_card_swiper.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> cards = [
    {'color': Colors.blue, 'text': 'Card 1'},
    {'color': Colors.red, 'text': 'Card 2'},
    {'color': Colors.green, 'text': 'Card 3'},
  ];

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Animation duration
    );

    // Start the animation automatically
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the controller
    super.dispose();
  }

  void _restartAnimation() {
    _animationController.reset(); // Reset the animation
    _animationController.forward(); // Start it again
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        -1000 *
                            (1 -
                                _animationController
                                    .value), // Move from left to right
                        0,
                      ),
                      child: Text(
                        'asdf',
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
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: FlipCardSwiper(
                cardData: cards,
                onCardChange: (newIndex) {
                  // Restart the text animation
                  _restartAnimation();
                },
                onCardCollectionAnimationComplete: (value) {
                  // Triggered when card collection animation finishes
                },
                // Build each card widget
                cardBuilder: (context, index, visibleIndex) {
                  final card = cards[index];
                  return Container(
                    width: size.height / 2,
                    height: size.height / 4,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 57, 66),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 112, 236, 255),
                        strokeAlign: BorderSide.strokeAlignOutside,
                        width: 2,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 112, 236, 255),
                          shadows: [
                            Shadow(
                              color: Colors.blue,
                              blurRadius: 3,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            card['text'],
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
