import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حديقة الحيوانات',
      theme: ThemeData(
        fontFamily: 'NotoNaskhArabic',
        primarySwatch: Colors.blue,
      ),
      home: const AnimalPark(),
    );
  }
}

class AnimalPark extends StatefulWidget {
  const AnimalPark({super.key});

  @override
  _AnimalParkState createState() => _AnimalParkState();
}

class _AnimalParkState extends State<AnimalPark> with TickerProviderStateMixin {
  final FlutterTts _tts = FlutterTts();
  int _stars = 3;
  bool _isSpeaking = false;
  bool _showWarning = false;

  final List<Map<String, dynamic>> _characters = [
    {
      'name': 'الحمار الوحشي',
      'image': 'assets/animation/zebra-talk.gif',
      'dialogues': ['أهلا أنا الحمار الوحشي', 'لي خطوط جميلة!'],
      'position': const Offset(100, 200), // تحديد مكان الحمار الوحشي
    },
    {
      'name': 'الفيل',
      'image': 'assets/animation/elephant-talk.gif',
      'dialogues': ['مرحبا أنا الفيل!', 'أنا أكبر الحيوانات!'],
      'position': const Offset(300, 200), // تحديد مكان الفيل
    },
  ];

  late AnimationController _mouthController;
  late AnimationController _handController;

  @override
  void initState() {
    super.initState();
    _mouthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _handController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _setupTts();
  }

  void _setupTts() async {
    await _tts.setLanguage("ar-SA");
    await _tts.setPitch(1.1);
    await _tts.setSpeechRate(0.5);
  }

  Future<void> _speak(int index) async {
    setState(() {
      _isSpeaking = true;
      _mouthController.repeat(reverse: true);
    });

    for (var dialogue in _characters[index]['dialogues']) {
      await _tts.speak(dialogue);
      await Future.delayed(const Duration(seconds: 2)); // تأخير بين الجمل
    }

    setState(() {
      _isSpeaking = false;
      _mouthController.stop();
    });
  }

  void _handleHandTap() {
    if (_isSpeaking) {
      setState(() {
        _showWarning = true;
        _stars = _stars > 0 ? _stars - 1 : 0;
        _handController.forward(from: 0.0);
      });

      _tts.speak("استنى دورك!");

      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _showWarning = false);
      });
    }
  }

  @override
  void dispose() {
    _mouthController.dispose();
    _handController.dispose();
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية مع صورة الغابة
          _buildBackground(),

          // الحيوانات
          for (var i = 0; i < _characters.length; i++)
            Positioned(
              left: _characters[i]['position'].dx,
              top: _characters[i]['position'].dy,
              child: GestureDetector(
                onTap: () => _speak(i), // التحدث عند النقر على الحيوان
                child: _buildCharacter(i),
              ),
            ),

          // زر اليد
          Positioned(
            bottom: 50,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: _buildHandButton(),
          ),

          // النجوم
          Positioned(
            bottom: 120,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: _buildStars(),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/forest.jpg'), // صورة الغابة
          fit: BoxFit.cover, // تغطية الشاشة بالكامل
        ),
      ),
    );
  }

  Widget _buildCharacter(int index) {
    bool isSpeaking = _isSpeaking;

    return AnimatedScale(
      scale: isSpeaking ? 1.1 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(0), // تعديل اتجاه الحيوانات
                child: Image.asset(
                  _characters[index]['image'],
                  width: 190,
                  height: 200,
                ),
              ),
              if (isSpeaking)
                AnimatedBuilder(
                  animation: _mouthController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _mouthController.value * 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Text(
                          _characters[index]['dialogues'][0], // عرض الجملة الأولى
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _characters[index]['name'],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black,
                  offset: Offset(2, 2),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHandButton() {
    return AnimatedBuilder(
      animation: _handController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _handController.value * 20),
          child: GestureDetector(
            onTap: _handleHandTap,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _showWarning ? Colors.red.withOpacity(0.3) : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.back_hand,
                size: 60,
                color: _showWarning ? Colors.red : Colors.amber[700],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
            (index) => Icon(
          Icons.star,
          size: 40,
          color: index < _stars ? Colors.amber : Colors.grey,
        ),
      ),
    );
  }
}