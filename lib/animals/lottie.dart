import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';  // Import the lottie package

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({super.key});

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/animation/lion.json"),  // Load the animation from assets
      ),
    );
  }
}

