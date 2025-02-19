import 'dart:developer';
import 'package:custom_loadings/widgets/arc_reactor.dart';
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
    {'id': 1, 'text': 'Card 1'},
    {'id': 2, 'text': 'Card 2'},
    {'id': 3, 'text': 'Card 3'},
    {'id': 4, 'text': 'Card 4'},
    {'id': 5, 'text': 'Card 5'},
    {'id': 6, 'text': 'Card 6'},
  ];

  late AnimationController _animationController;
  late Map<String, dynamic> currentCard;

  @override
  void initState() {
    super.initState();
    currentCard = cards[0];

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _restartAnimation() {
    _animationController.reset();
    _animationController.forward();
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
                        -1000 * (1 - _animationController.value),
                        0,
                      ),
                      child: Text(
                        currentCard['text'],
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
                  log('current index :$newIndex');
                  _restartAnimation();
                  setState(() {
                    currentCard = cards[newIndex];
                  });
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
                    child: Row(
                      children: [
                        Expanded(
                          child: ArcReactor(
                            radius: -20,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
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
                              const Divider(
                                color: Color.fromARGB(255, 112, 236, 255),
                              ),
                            ],
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
