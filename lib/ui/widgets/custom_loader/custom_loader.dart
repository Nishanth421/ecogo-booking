import 'dart:math';
import 'package:flutter/material.dart';

import 'loader_painter.dart';

class AirplaneLoader extends StatefulWidget {
  const AirplaneLoader({super.key});

  @override
  State<AirplaneLoader> createState() => _AirplaneLoaderState();
}

class _AirplaneLoaderState extends State<AirplaneLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.orange,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, _) {
        return Transform.rotate(
          angle: pi / 4, // 45 degrees
          child: CustomPaint(
            size: const Size(120, 120),
            painter: AirplanePainter(_colorAnimation.value!),
          ),
        );
      },
    );
  }
}
