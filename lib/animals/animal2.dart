import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Animaldetails extends StatefulWidget {
  const Animaldetails({
    super.key,
    required this.Name,
    required this.sound, required this.Name1, required this.bimage,
    required this.nameColor,
    required this.name1Top,
    required this.name1Left,
    required this.nameTop,
    required this.nameLeft,
  });

  final String Name;
  final String Name1;
  final String sound;
  final String bimage;

  final Color nameColor;
  final double name1Top;
  final double name1Left;
  final double nameTop;
  final double nameLeft;

  @override
  State<Animaldetails> createState() => _AnimaldetailsState();
}

class _AnimaldetailsState extends State<Animaldetails> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer.setSource(AssetSource(widget.sound)).catchError((error) {
      debugPrint("AudioPlayer error: $error");
    });
  }

  @override
  void dispose() {
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
            image: AssetImage(widget.bimage),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop("animal");
                },
                icon: Icon(Icons.arrow_back, color: Colors.brown[800], size: 40),
              ),
            ),
            Positioned(
              top: widget.name1Top,
              left: widget.name1Left,
              child: Text(
                widget.Name1,
                style: TextStyle(
                  color: widget.nameColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpicyRice',
                  fontSize: 70,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: widget.nameTop,
              left: widget.nameLeft,
              child: Text(
                widget.Name,
                style: TextStyle(
                  color: widget.nameColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpicyRice',
                  fontSize: 70,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 160,
              bottom: 20,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                  color: Colors.brown[800],
                  size: 70,
                ),
                onPressed: () async {
                  try {
                    if (isPlaying) {
                      await _audioPlayer.pause();
                    } else {
                      await _audioPlayer.play(AssetSource(widget.sound));
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  } catch (error) {
                    debugPrint("Error playing sound: $error");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

