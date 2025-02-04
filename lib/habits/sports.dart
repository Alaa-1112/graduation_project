import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class sports extends StatefulWidget {
  @override
  _sportsState createState() =>
      _sportsState();
}

class _sportsState
    extends State<sports> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _images = [
    'assets/animation/jump.gif',
    'assets/animation/stretch.gif',
    'assets/animation/basketball.gif',
    'assets/animation/Sports.gif',
    "assets/animation/sports (2).gif"
  ]; // قائمة الصور
  int _currentIndex = 0; // مؤشر الصورة الحالية
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _playSong();
    _startImageSwitch(); // بدء التبديل بين الصور بشكل دوري
  }

  // تشغيل الأغنية
  void _playSong() async {
    await _audioPlayer.play(AssetSource('audio/sports.mp3')); // استبدل بمسار الأغنية
  }

  // بدء التبديل بين الصور بشكل دوري
  void _startImageSwitch() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length; // تبديل الصورة الحالية
      });
    });
  }

  @override
  void dispose() {
    // إيقاف الأغنية والتكرار عند الخروج من الصفحة
    _audioPlayer.stop();
    _timer.cancel(); // إيقاف المؤقت
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              _images[_currentIndex], // عرض الصورة بناءً على المؤشر الحالي
              fit: BoxFit.fill,
              height: double.infinity, // جعل الصورة تأخذ كامل الشاشة
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: sports(),
  ));
}