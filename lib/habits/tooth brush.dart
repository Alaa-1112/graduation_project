import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class BrushingBuddyScreen extends StatefulWidget {
  @override
  _BrushingBuddyScreenState createState() => _BrushingBuddyScreenState();
}

class _BrushingBuddyScreenState extends State<BrushingBuddyScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isBrushing = false;
  int _secondsRemaining = 63;
  late Timer _timer;
  int _starsEarned = 0;

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _startBrushing() async {
    setState(() {
      _isBrushing = true;
      _secondsRemaining = 63;
    });

    try {
      await _audioPlayer.play(AssetSource('audio/brush.mp3'));
    } catch (e) {
      print("Error playing audio: $e");
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
          _showRewardDialog();
        }
      });
    });
  }

  void _showRewardDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/animation/conf.gif', width: 200),
            Image.asset('assets/images/shiny_teeth.png', width: 100),
            Text('أحسنت! اكسبت نجمة 🎉', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
    setState(() => _starsEarned++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bathroom.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Positioned(
            top: 250,
            left: -80,
            child: Visibility(
              visible: _isBrushing,
              child: Image.asset(
                'assets/animation/cat-brushing.gif',
                width: 600,
                height: 600,
                gaplessPlayback: true,
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'الوقت المتبقي: $_secondsRemaining ثانية',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black, blurRadius: 10)
                    ],
                  ),
                ),
                SizedBox(height: 5),
                ElevatedButton.icon(
                  icon: Icon(Icons.brush,color: Colors.teal[300],),
                  label: Text(
                    _isBrushing ? 'جاري التنظيف...' : 'ابدأ الآن!',
                    style: TextStyle(fontSize: 20,color: Colors.teal[300]),
                  ),
                  onPressed: _isBrushing ? null : _startBrushing,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  children: List.generate(
                    _starsEarned,
                        (i) => Icon(Icons.star, color: Colors.yellow, size: 40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}