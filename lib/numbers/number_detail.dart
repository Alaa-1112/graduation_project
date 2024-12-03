/*import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Numdetail extends StatefulWidget {
  const Numdetail({
    super.key,
    required this.num,
    required this.sound,
    required this.image,
    required this.backimg,
  });

  final String num;
  final String backimg;
  final String sound;
  final String image;

  @override
  State<Numdetail> createState() => _NumdetailState();
}

class _NumdetailState extends State<Numdetail> with TickerProviderStateMixin {
  final List<int> _items = [];
  Timer? _timer;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _startAddingItemsWithSound();
  }

  Future<void> _startAddingItemsWithSound() async {
    _items.clear();
    _timer?.cancel();

    final String normalizedNum = convertArabicToEnglishNumbers(widget.num);
    final int totalItems = int.tryParse(normalizedNum) ?? 0;

    for (int i = 0; i < totalItems; i++) {
      await Future.delayed(const Duration(seconds: 1)); // تأخير بين كل رقم
      if (!mounted) return; // إذا تم الخروج من الصفحة
      setState(() {
        _items.add(i + 1);
      });
      _playSound(); // تشغيل الصوت مع الرقم
    }
  }

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource(widget.sound));
  }

  @override
  void dispose() {
    _timer?.cancel();
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
            image: AssetImage(widget.backimg),
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
              left: 170,
              child: Text(
                widget.num,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // عدد الأعمدة
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final animationController = AnimationController(
                    vsync: this,
                    duration: const Duration(milliseconds: 500),
                  )..forward();

                  final animation = Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0),
                  ).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Curves.easeInOut,
                  ));

                  return SlideTransition(
                    position: animation,
                    child: Image.asset(widget.image, width: 80), // عرض الصورة فقط
                  );
                },
              ),
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
}*/
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Numdetail extends StatefulWidget {
  const Numdetail({
    super.key,
    required this.num,
    required this.sound,
    required this.image,
    required this.backimg,
  });

  final String num;
  final String backimg;
  final String sound;
  final String image;

  @override
  State<Numdetail> createState() => _NumdetailState();
}

class _NumdetailState extends State<Numdetail> with TickerProviderStateMixin {
  final List<int> _items = [];
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _startAddingItemsAndPlaySound();
  }

  void _startAddingItemsAndPlaySound() {
    _items.clear();

    final String normalizedNum = convertArabicToEnglishNumbers(widget.num);
    final int totalItems = int.tryParse(normalizedNum) ?? 0;

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        for (int i = 0; i < totalItems; i++) {
          _items.add(i + 1);
        }
        _playSound(); // تشغيل الصوت بعد إضافة العناصر
      });
    });
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
            image: AssetImage(widget.backimg),
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
              left: 170,
              child: Text(
                widget.num,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // عدد الأعمدة
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final animationController = AnimationController(
                    vsync: this,
                    duration: const Duration(milliseconds: 500),
                  )..forward();

                  final animation = Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0),
                  ).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Curves.easeInOut,
                  ));

                  return SlideTransition(
                    position: animation,
                    child: Image.asset(widget.image, width: 80), // عرض الصورة فقط
                  );
                },
              ),
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


