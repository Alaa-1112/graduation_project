/*import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CleanPage extends StatefulWidget {
  @override
  _CleanPageState createState() => _CleanPageState();
}

class _CleanPageState extends State<CleanPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playSong();
  }

  void _playSong() async {
    // قم بتشغيل الأغنية
    await _audioPlayer.play(AssetSource('audio/clean.mp3'));
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
              'assets/animation/clean-room.gif',
              fit: BoxFit.fill,
            ),
          ),
          // النص
             Align(
               alignment: Alignment.bottomCenter,
               child: Padding(
                   padding: EdgeInsets.only(bottom: 50),
                 child: Image.asset(
                     "assets/animation/dob.gif",
                      width: 250,
                   height: 250,
                 ),

               ),
             )
        ],
      ),
    );
  }
}*/


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class clean extends StatefulWidget {
  @override
  _cleanState createState() =>
      _cleanState();
}

class _cleanState
    extends State<clean> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _images = [
    'assets/animation/clean-room.gif',
    'assets/animation/vacum.gif',
    'assets/animation/toys.gif',
    'assets/animation/toy2.gif',
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
    await _audioPlayer.play(AssetSource('audio/clean.mp3')); // استبدل بمسار الأغنية
  }

  // بدء التبديل بين الصور بشكل دوري
  void _startImageSwitch() {
    _timer = Timer.periodic(Duration(seconds: 9), (timer) {
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
    home: clean(),
  ));
}