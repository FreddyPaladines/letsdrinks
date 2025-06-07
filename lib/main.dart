import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const AnimatedImage(),
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Inicia la animación al cargar el widget
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 49, 18, 55),
            Color.fromARGB(255, 25, 6, 35), // Color morado en la parte superior
            Colors.black, // Color negro en la parte inferior
          ],
        ),
      ), // Fondo negro
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: screenHeight * 0.06, // 10% desde la parte inferior
            left: screenWidth * 0.17,
            child: Image.asset(
              "assets/Lets.png",
              width: screenWidth * 0.5,
              height: screenHeight * 0.2,
            ),
          ),
          Positioned(
              top: screenHeight * 0.09, // 10% desde la parte inferior
              child: Image.asset("assets/Drink.png", width: screenWidth * 0.7, height: screenHeight * 0.3)),
          Positioned(
            right: screenWidth * 0.15,
            bottom: screenHeight * 0.3, // 10% desde la parte inferior
            child: Transform.rotate(
                angle: 350 * (3.14 / 180),
                child: Image.asset("assets/pizzaRebanada.png", width: 80, height: 80)),
          ),
          Positioned(
            left: screenWidth * 0.1, // 10% desde la parte izquierda
            child: Image.asset("assets/audifonos.png", width: 80, height: 80),
          ),
          Positioned(
            top: screenHeight * 0.3,
            right: screenWidth * 0.1, // 10% desde la parte derecha
            child: Transform.rotate(
                angle: 330 * (3.14 / 180), child: Image.asset("assets/Pecado.png", width: 80, height: 80)),
          ),
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                "assets/DosShotsRosadpHD.png",
                width: screenWidth * 0.7,
                height: screenHeight * 0.35,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.1,
            bottom: screenHeight * 0.3, // 10% desde la parte superior
            child: Transform.rotate(
              angle: 330 * (3.14 / 180), // Convierte 30 grados a radianes
              child: Image.asset("assets/EmojiDiabolico.png", width: 100, height: 100),
            ),
          ),
        ],
      ),
    );
  }
}
