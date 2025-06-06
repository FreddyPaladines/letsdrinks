import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CenteredImageWithAnimation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CenteredImageWithAnimation extends StatefulWidget {
  const CenteredImageWithAnimation({super.key});

  @override
  State<CenteredImageWithAnimation> createState() => _CenteredImageWithAnimationState();
}

class _CenteredImageWithAnimationState extends State<CenteredImageWithAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Image.asset("DosShotsRosados.png", fit: BoxFit.cover),
        ),
      ),
    );
  }
}