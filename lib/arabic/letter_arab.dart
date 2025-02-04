import 'package:flutter/material.dart';

class LetterArab extends StatefulWidget {
  final String letter;
  final String word;
  final String image;

  const LetterArab({
    Key? key,
    required this.letter,
    required this.word,
    required this.image,
  }) : super(key: key);

  @override
  _LetterArabState createState() => _LetterArabState();
}

class _LetterArabState extends State<LetterArab> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),

      // Slide in from left
      end: Offset.zero, // Move to the center position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0CF2EE),size:40 ),
        title: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFF0CF2EE),  Color(0xFFEAF2DC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(widget.letter,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold, fontSize: 40, ),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display letter text
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Color(0xFF0CF2EE),  Color(0xFFEAF2DC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                widget.letter,
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Display word text
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Color(0xFF0CF2EE),  Color(0xFFEAF2DC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                widget.word,
                style: const TextStyle(
                  fontSize: 50,
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Display image with slide transition below the text
            SlideTransition(
              position: _animation,
              child: Padding(
                padding: const EdgeInsets.only(top: 20), // Optional spacing between text and image
                child: Image.asset(
                  widget.image,
                  height: 260,
                  width: 240,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



