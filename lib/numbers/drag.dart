import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'numbers.dart';

void main() => runApp(MathQuizApp());

class MathQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mathdrag(),
    );
  }
}

class Mathdrag extends StatefulWidget {
  const Mathdrag({super.key});

  @override
  State<Mathdrag> createState() => _MathdragState();
}

class _MathdragState extends State<Mathdrag> {
  late List<Question> items;
  late List<Question> items2;
  late int score;
  late bool gameover;
  final AudioPlayer player = AudioPlayer(); // Instance for audio player

  void initGame() {
    gameover = false;
    score = 0;
    items = [
      Question(image: "assets/images/4birds.png", name: "٤", value: "٤"),
      Question(image: "assets/images/9bee.png", name: "٩", value: "٩"),
      Question(image: "assets/images/2mango.png", name: "٢", value: "٢"),
      Question(image: "assets/images/6flowers.png", name: "٦", value: "٦"),
      Question(image: "assets/images/10apples.png", name: "١٠", value: "١٠"),
      Question(image: "assets/images/5banana.png", name: "٥", value: "٥"),
      Question(image: "assets/images/7straw.png", name: "٧", value: "٧"),
      Question(image: "assets/images/3orange.png", name: "٣", value: "٣"),
    ];
    items2 = List<Question>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  Future<void> playSound(String fileName) async {
    try {
      await player.stop(); // إيقاف الصوت الحالي
      await player.play(AssetSource(fileName)); // تشغيل الصوت الجديد
    } catch (e) {
      print('Error playing sound: $e');
    }
  }


  void showFinalScore(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Game Over'),
        content: Text('Your final score is: $score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Mathdrag()),
              );
            },
            child: const Text('إعادة الاختبار'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Numbers()),
              );
            },
            child: Text('الرجوع للصفحة الرئيسية'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty && !gameover) {
      gameover = true;
      Future.delayed(Duration.zero, () => showFinalScore(context));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Score: ',
                        style: TextStyle(color: Colors.black, fontSize: 35),
                      ),
                      TextSpan(
                        text: '$score',
                        style: TextStyle(color: Colors.teal, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              if (!gameover)
                Row(
                  children: [
                    Spacer(),
                    Column(
                      children: items.map((item) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          child: Draggable<Question>(
                            data: item,
                            childWhenDragging: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Image.asset(item.image),
                            ),
                            feedback: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Image.asset(item.image),
                            ),
                            child: Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Image.asset(item.image),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Spacer(flex: 2),
                    Column(
                      children: items2.map((item) {
                        return DragTarget<Question>(
                          onAccept: (receivedItem) async {
                            if (item.value == receivedItem.value) {
                              setState(() {
                                items.remove(receivedItem);
                                items2.remove(item);
                              });
                              score += 10;
                              await playSound('audio/احسنت.mp3'); // Play correct sound
                              item.accept = false;
                            } else {
                              setState(() {
                                score -= 5;
                                item.accept = false;
                              });
                              await playSound('audio/خطا.mp3'); // Play wrong sound
                            }
                          },
                          onWillAccept: (receivedItem) {
                            setState(() {
                              item.accept = true;
                            });
                            return true;
                          },
                          onLeave: (receivedItem) {
                            setState(() {
                              item.accept = false;
                            });
                          },
                          builder: (context, acceptedItems, rejectedItems) =>
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: item.accept
                                      ? Colors.grey[400]
                                      : Colors.grey[200],
                                ),
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.width / 6.5,
                                width: MediaQuery.of(context).size.width / 3,
                                margin: EdgeInsets.all(35),
                                child: Text(
                                  item.name,
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                                ),
                              ),
                        );
                      }).toList(),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String image;
  final String name;
  final String value;
  bool accept;
  Question({
    required this.image,
    required this.name,
    required this.value,
    this.accept = false,
  });
}

