import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // To play the sound

class StoryDetailPage extends StatefulWidget {
  final String txt;
  final String soundUrl;
  final String detailImage;

  const StoryDetailPage({
    Key? key,
    required this.txt,
    required this.soundUrl,
    required this.detailImage,
  }) : super(key: key);

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  bool _isFavorited = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() => duration = newDuration);
    });
    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() => position = newPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image of the story
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop("story");
                  },
                  icon: Icon(Icons.chevron_left, color: Colors.black),
                ),
                SizedBox(width: 120),
                Text(
                  "Story",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
              widget.detailImage,
              fit: BoxFit.cover,
              width: 390,
              height: 300
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Text(
              widget.txt,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color:Color(0xFF45FFD4),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite,
                color: _isFavorited ? Color(0xFF45FFD4): Colors.grey,
                size: 35,
              ),
              onPressed: () {
                setState(() {
                  _isFavorited = !_isFavorited; // Toggle the state
                });
              },
            ),
          ),
          SizedBox(height: 80,),
          Slider(
            value: position.inSeconds.toDouble(),
            min: 0.0,
            max: duration.inSeconds > 0 ? duration.inSeconds.toDouble() : 1.0,
            onChanged: (double value) {
              setState(() {
                seekToSecond(value.toInt());
              });
            },
            activeColor: Color(0xFF45FFD4),
            inactiveColor: Colors.grey,
            divisions: duration.inSeconds > 0 ? duration.inSeconds : null,
            label: "${position.inSeconds.toDouble().toStringAsFixed(0)}s",
            thumbColor: Color(0xFF45FFD4),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Current time of audio
                Text(
                  "${position.inSeconds}s",
                  style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                ),
                // Remaining time of audio
                Text(
                  "-${(duration.inSeconds - position.inSeconds).toString()}s",
                  style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 20),
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrease 10 seconds button
                IconButton(
                  icon: Icon(Icons.replay_10, color:Color(0xFF2FA9A3),size: 33,),
                  onPressed: () {
                    setState(() {
                      position = position - Duration(seconds: 10);
                      seekToSecond(position.inSeconds);
                    });
                  },
                ),
                SizedBox(width: 30,),
                Icon(Icons.skip_previous,size: 33,color:Color(0xFF2FA9A3)),
                SizedBox(width: 40,),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                    color: Color(0xFF45FFD4),
                    size: 50,
                  ),
                  onPressed: () async {
                    if (isPlaying) {
                      await _audioPlayer.pause();
                    } else {
                      await _audioPlayer.play(AssetSource(widget.soundUrl)); // Play from widget.soundUrl
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                ),
                // Increase 10 seconds button
                SizedBox(width: 30,),
                Icon(Icons.skip_next,size: 33,color: Color(0xFF2FA9A3)),
                SizedBox(width: 30,),
                IconButton(
                  icon: Icon(Icons.forward_10, color: Color(0xFF2FA9A3),size: 33,),
                  onPressed: () {
                    setState(() {
                      position = position + Duration(seconds: 10);
                      seekToSecond(position.inSeconds);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ));

  }

  Future seekToSecond(int second) async {
    await _audioPlayer.seek(Duration(seconds: second));
  }
}


