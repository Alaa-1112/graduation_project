/*import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(KindnessToAnimalsApp());
}

class KindnessToAnimalsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الرفق بالحيوان',
      home: KindnessToAnimalsScreen(),
    );
  }
}

class KindnessToAnimalsScreen extends StatefulWidget {
  @override
  _KindnessToAnimalsScreenState createState() =>
      _KindnessToAnimalsScreenState();
}

class _KindnessToAnimalsScreenState extends State<KindnessToAnimalsScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playAudio();
  }

  void _playAudio() async {
    try {
      await _audioPlayer.play(AssetSource('audio/feed-dog.mp3'));
      print('الصوت يعمل بنجاح');
    } catch (e) {
      print('حدث خطأ أثناء تشغيل الصوت: $e');
    }
    Future.delayed(Duration(seconds: 33), () {
      _audioPlayer.pause(); // إيقاف الصوت بعد 33 ثانية
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop(); // إيقاف الصوت عند الخروج من الصفحة
    _audioPlayer.dispose(); // تحرير الموارد
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
              'assets/images/farm.jpg',
              fit: BoxFit.fill,
            ),
          ),
          // صورة الكلب
          Positioned(
            bottom: 50,
            left: 180,
            child: Image.asset(
              'assets/animation/dog-drink.gif',
              height: 300,
              width: 180,
            ),
          ),
          // صورة الرجل
          Positioned(
            bottom: 120,
            right: 170,
            child: Image.asset(
              'assets/images/feed__dog.png',
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}*/


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class KindnessToAnimalsApp extends StatefulWidget {
  @override
  _KindnessToAnimalsAppState createState() =>
      _KindnessToAnimalsAppState();
}

class _KindnessToAnimalsAppState
    extends State<KindnessToAnimalsApp> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _images = [
    'assets/animation/animal1.gif',
    'assets/animation/animal2.gif',
    'assets/animation/animal3.gif',
    'assets/animation/animal4.gif',
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
    await _audioPlayer.play(AssetSource('audio/feed-dog.mp3')); // استبدل بمسار الأغنية
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
    home: KindnessToAnimalsApp(),
  ));
}