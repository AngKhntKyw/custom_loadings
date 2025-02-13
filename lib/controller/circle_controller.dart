import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DottedCircleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final rotationAngle = 0.0.obs; // Make rotationAngle observable

  @override
  void onInit() {
    super.onInit();
    // Initialize the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30), // Rotation speed
    )..repeat(); // Start continuous rotation

    // Listen to animation updates and update rotationAngle
    animationController.addListener(() {
      rotationAngle.value = animationController.value * 2 * 3.1416;
    });
  }

  @override
  void onClose() {
    animationController.dispose(); // Dispose the controller
    super.onClose();
  }
}
