import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Numdetail extends StatefulWidget {
  const Numdetail({
    super.key,
    required this.num,
    required this.sound,
  });

  final String num;
  final String sound;

  @override
  State<Numdetail> createState() => _NumdetailState();
}

class _NumdetailState extends State<Numdetail> {
  final List<int> _items = [];
  final List<Offset> _positions = [];
  final List<Offset> _randomPositions = [];
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _generateRandomPositions();
  }

  void _generateRandomPositions() {
    _items.clear();
    _positions.clear();
    _randomPositions.clear();

    final String normalizedNum = convertArabicToEnglishNumbers(widget.num);
    final int totalItems = int.tryParse(normalizedNum) ?? 0;

    if (totalItems > 0) {
      final Random random = Random();
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      for (int i = 0; i < totalItems; i++) {
        _items.add(i + 1);
        _positions.add(Offset(screenWidth / 2, -80));  // بدأ الصور من الأعلى
        _randomPositions.add(Offset(random.nextDouble() * screenWidth, random.nextDouble() * screenHeight));  // توليد مواقع عشوائية
      }

      setState(() {});

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          for (int i = 0; i < _positions.length; i++) {
            _positions[i] = _randomPositions[i];
          }
        });
      });

      _playSound(); // تشغيل الصوت بعد إضافة العناصر
    }
  }

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource(widget.sound));
  }

  @override
  void dispose() {
    _audioPlayer.stop(); // إيقاف الصوت عند مغادرة الصفحة
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/خلية.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back, color: Colors.brown[800], size: 40),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 250,
              child: Text(
                widget.num,
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            for (int i = 0; i < _items.length; i++)
              AnimatedPositioned(
                key: ValueKey(_items[i]),
                left: _positions.isNotEmpty ? _positions[i].dx : 0,
                top: _positions.isNotEmpty ? _positions[i].dy : 0,
                duration: Duration(seconds: 2),
                child: Image.asset("assets/images/bee.png", width: 80), // عرض الصورة فقط
              ),
          ],
        ),
      ),
    );
  }
}

String convertArabicToEnglishNumbers(String input) {
  const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  const englishDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  for (int i = 0; i < arabicDigits.length; i++) {
    input = input.replaceAll(arabicDigits[i], englishDigits[i]);
  }

  return input;
}









