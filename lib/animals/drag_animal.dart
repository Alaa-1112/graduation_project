import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kids/animals/home_alimant.dart';
class Draganimals extends StatefulWidget {
  const Draganimals({super.key});

  @override
  State<Draganimals> createState() => _DraganimalsState();
}

class _DraganimalsState extends State<Draganimals> {
  late List<Question> items;
  late List<Question> items2;
  late int score;
  late bool gameover;
  final AudioPlayer player = AudioPlayer(); // Instance for audio player

  void initGame() {
    gameover = false;
    score = 0;
    items = [
      Question(image: "assets/images/rabbit_ques.png", name: "أرنب", value: "أرنب"),
      Question(image: "assets/images/elephant_ques.png", name:  'فيل', value:  'فيل'),
      Question(image: "assets/images/lion_ques.png", name:  'أسد', value:  'أسد'),
      Question(image: "assets/images/cat_ques.png", name: 'قطة', value: 'قطة'),
      Question(image: "assets/images/giraffe_ques.png", name: 'زرافة', value: 'زرافة'),
      Question(image: "assets/images/fox_ques.png", name: 'ثعلب', value: 'ثعلب'),
      Question(image: "assets/images/monkey_ques.png", name: 'قرد', value: 'قرد'),
      Question(image: "assets/images/tiger_ques.png", name: 'نمر', value: 'نمر'),
      Question(image: "assets/images/peacock_ques.png", name:'طاووس', value: 'طاووس'),
      Question(image: "assets/images/parrot_ques.png", name: 'ببغاء', value: 'ببغاء'),
      Question(image: "assets/images/deer_ques.png", name: 'غزالة', value: 'غزالة'),
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
                MaterialPageRoute(builder: (context) => Draganimals()),
              );
            },
            child: const Text('إعادة الاختبار'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Homeanimals()),
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


