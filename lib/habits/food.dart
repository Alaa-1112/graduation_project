import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(SoundAndImageApp());
}

class SoundAndImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'صورة وصوت',
      home: Food (),
    );
  }
}

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food > {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playSound();
  }

  void _playSound() async {
    await _audioPlayer.play(AssetSource('audio/healthy.mp3')); // تشغيل الصوت من الملفات
  }

  @override
  void dispose() {
    _audioPlayer.stop(); // إيقاف الصوت عند مغادرة الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية الشاشة
          Positioned.fill(
            child: Image.asset(
              'assets/images/kitchen.jpg',
              fit: BoxFit.fill,
            ),
          ),
          // وضع الصورة في مكان معين
          Positioned(
            bottom: 60, // المسافة من أعلى الشاشة
            left: 115, // المسافة من يسار الشاشة
            child: Image.asset(
              'assets/animation/fruits.gif', // الصورة التي تريد عرضها
              width: 230,
              height: 270,
            ),
          ),
        ],
      ),
    );
  }
}