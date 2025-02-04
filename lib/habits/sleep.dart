import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class Sleep extends StatefulWidget {
  @override
  _SleepState createState() =>
      _SleepState();
}

class _SleepState
    extends State<Sleep> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _showImage1 = true; // لتحديد أي صورة تعرض
  late Timer _timer; // متغير لتكرار عرض الصور

  @override
  void initState() {
    super.initState();
    _playSong();
    _startImageSwitch(); // بدء التبديل بين الصور بشكل دوري
  }

  // تشغيل الأغنية
  void _playSong() async {
    await _audioPlayer.play(AssetSource('audio/sleep.mp3')); // استبدل بمسار الأغنية
  }

  // بدء التبديل بين الصور بشكل دوري كل 3 ثوانٍ
  void _startImageSwitch() {
    _timer = Timer.periodic(Duration(seconds: 20), (timer) {
      setState(() {
        _showImage1 = !_showImage1; // التبديل بين الصورة الأولى والثانية
      });
    });
  }

  @override
  void dispose() {
    // إيقاف الأغنية والتكرار عند الخروج من الصفحة
    _audioPlayer.stop();
    _timer.cancel(); // إيقاف التكرار
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // عرض الصورة الأولى إذا كان _showImage1 = true
            if (_showImage1)
              Image.asset(
                'assets/animation/sleep.gif', // استبدل بالمسار للصورة الأولى
                fit: BoxFit.fill,
                height: double.infinity, // جعل الصورة تأخذ كامل الشاشة
                width: double.infinity,
              ),
            // عرض الصورة الثانية إذا كان _showImage1 = false
            if (!_showImage1)
              Image.asset(
                'assets/animation/wakeup.gif', // استبدل بالمسار للصورة الثانية
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
    home: Sleep(),
  ));
}

