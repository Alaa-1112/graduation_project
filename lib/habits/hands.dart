import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HandWashingPage extends StatefulWidget {
  @override
  _HandWashingPageState createState() => _HandWashingPageState();
}

class _HandWashingPageState extends State<HandWashingPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playSong();
  }

  void _playSong() async {
    // قم بتشغيل الأغنية
    await _audioPlayer.play(AssetSource('audio/hands.mp3'));
  }

  @override
  void dispose() {
    // أوقف الأغنية عند الخروج
    _audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية (ملف GIF)
          Positioned.fill(
            child: Image.asset(
              'assets/animation/wash hands.gif',
              fit: BoxFit.fill,
            ),
          ),
          // النص

        ],
      ),
    );
  }
}