import 'package:flutter/material.dart';

class LetterPage extends StatefulWidget {
  final String letter;
  final String word;
  final String image;

  const LetterPage({
    Key? key,
    required this.letter,
    required this.word,
    required this.image,
  }) : super(key: key);

  @override
  _LetterPageState createState() => _LetterPageState();
}

class _LetterPageState extends State<LetterPage> with SingleTickerProviderStateMixin {
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
        iconTheme: IconThemeData(color:  Colors.orange,size:40 ),
        title: Text(widget.letter,style: TextStyle(color:Colors.orange,fontWeight: FontWeight.bold, fontSize: 40, ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display letter text
            Text(
              widget.letter,
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),

            // Display word text
            Text(
              widget.word,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
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



