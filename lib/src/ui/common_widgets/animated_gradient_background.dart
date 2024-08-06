import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

/// Animating gradient backgorund for views
class AnimatedGradientBackground extends StatelessWidget {
  const AnimatedGradientBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
    return AnimateGradient(
      duration: const Duration(seconds: 6),
      primaryBeginGeometry: const AlignmentDirectional(0, 1),
      primaryEndGeometry: const AlignmentDirectional(2, 1),
      secondaryBeginGeometry: const AlignmentDirectional(5, 1),
      secondaryEndGeometry: const AlignmentDirectional(2, -0.8),
      primaryColors: const [
        Color(0xFF111111),
        Color.fromARGB(255, 43, 17, 35),
        // Colors.white,
        // Colors.white
      ],
      secondaryColors: const [
        Color.fromARGB(255, 14, 32, 30),
        Color.fromARGB(255, 24, 18, 31),
        // Colors.white,
        // Colors.white
      ],
      child: child,
    );
  }
}
