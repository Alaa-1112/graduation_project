import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Animaldetails extends StatefulWidget {
  const Animaldetails({
    super.key,
    required this.image,
    required this.Name,
    required this.sound, required this.Name1,
  });

  final String image;
  final String Name;
  final String Name1;
  final String sound;

  @override
  State<Animaldetails> createState() => _AnimaldetailsState();
}

class _AnimaldetailsState extends State<Animaldetails> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Preload the sound file to ensure it's ready to play
    _audioPlayer.setSource(AssetSource(widget.sound)).catchError((error) {
      debugPrint("AudioPlayer error: $error");
    });
  }

  @override
  void dispose() {
    // Release resources when the widget is disposed
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
            image: AssetImage("assets/images/for.jpg"),
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

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Text(
                  widget.Name1,
                  style: TextStyle(
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpicyRice',
                    fontSize: 70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 170.0),
                child: Text(
                  widget.Name,
                  style: TextStyle(
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpicyRice',
                    fontSize: 70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),


                  Positioned(
                    bottom:170 ,
                      left: 50,
                      child: Image.asset(widget.image)),

               Positioned(
                 left: 160,
                 bottom: 20,
                 child: IconButton(
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
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
