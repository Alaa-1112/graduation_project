import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playAudio();
    _navigateToHome();
  }

  // Play audio when splash screen starts
  void _playAudio() async {
    await _audioPlayer.play(AssetSource('audio/anims.mp3'));
  }

  // Navigate to home screen after delay
  void _navigateToHome() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushNamed(context, "animal1"); // Replace with your home route
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Container(
             width: double.infinity,
             height: double.infinity,
             child: Image.asset('assets/images/anim.webp',fit: BoxFit.fill,)),

    );
  }
}
