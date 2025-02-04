import 'package:flutter/material.dart';
import 'package:kids/animals/animal1.dart';

import 'drag_animal.dart';

class Homeanimals extends StatefulWidget {
  const Homeanimals({super.key});

  @override
  State<Homeanimals> createState() => _HomeanimalsState();
}

class _HomeanimalsState extends State<Homeanimals> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _topAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _topAnimation = Tween<double>(begin: -150, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward(); // بدء الأنيميشن
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3FB03F), Colors.yellow[300]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 320.0, top: 25),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop('');
              },
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: _topAnimation.value,
                left: MediaQuery.of(context).size.width / 2 - 120,
                child: child!,
              );
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Animal1(),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/تعلم.png",
                width: 300,
                height: 300,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 130,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Draganimals(),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/اختبر.png",
                width: 300,
                height: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}






