import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class ColorMatchingGame extends StatefulWidget {
  @override
  _ColorMatchingGameState createState() => _ColorMatchingGameState();
}

class _ColorMatchingGameState extends State<ColorMatchingGame> {
  // الصور حسب الألوان
  List<String> redImages = ['assets/images/red1.png', 'assets/images/red2.png', 'assets/images/red4.png'];
  List<String> yellowImages = ['assets/images/yellow1.png', 'assets/images/yellow2.png', 'assets/images/yellow3.png'];
  List<String> orangeImages = ['assets/images/orange1.png', 'assets/images/orange2.png', 'assets/images/orange3.png'];

  // الدوائر المستهدفة
  List<String> redTarget = [];
  List<String> yellowTarget = [];
  List<String> orangeTarget = [];

  // ترتيب الصور بشكل عشوائي
  List<String> allImages = [];

  // مشغل الصوت
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlayingQuestion = false;
  bool _isPlayingCelebration = false;

  // تحريك الأقلام
  bool _movePencils = false;

  @override
  void initState() {
    super.initState();
    allImages = [...redImages, ...yellowImages, ...orangeImages];
    allImages.shuffle(Random());
    _playQuestionSound();
  }

  // تشغيل صوت السؤال
  void _playQuestionSound() async {
    _isPlayingQuestion = true;
    await _audioPlayer.play(AssetSource('audio/drag color.mp3'));
    _isPlayingQuestion = false;
  }

  // تشغيل صوت التشجيع
  void _playCelebrationSound() async {
    _isPlayingCelebration = true;
    await _audioPlayer.play(AssetSource('audio/احسنت.mp3'));
    _isPlayingCelebration = false;
  }

  // التحقق من اكتمال اللعبة
  void _checkGameCompletion() {
    if (redTarget.length == 3 && yellowTarget.length == 3 && orangeTarget.length == 3) {
      setState(() {
        _movePencils = true;
      });
      _playCelebrationSound();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // زر الرجوع
            IconButton(
              onPressed: () {
                Navigator.of(context).pop('');
              },
              icon: Icon(Icons.arrow_back, size: 25, color: Colors.black),
            ),
            // الأقلام
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              top: _movePencils ? MediaQuery.of(context).size.height * 0.5 : 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildPencilColumn("Yellow", Colors.yellow, yellowTarget, yellowImages),
                  buildPencilColumn("Orange", Colors.orange, orangeTarget, orangeImages),
                  buildPencilColumn("Red", Colors.red, redTarget, redImages),
                ],
              ),
            ),
            // الصور القابلة للسحب
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: [
                    for (var image in allImages)
                      if (!redTarget.contains(image) &&
                          !yellowTarget.contains(image) &&
                          !orangeTarget.contains(image))
                        Draggable<String>(
                          data: image,
                          feedback: ClipRRect(
                            child: Image.asset(image, width: 50, height: 50, fit: BoxFit.fill),
                          ),
                          childWhenDragging: Container(), // إخفاء الصورة عند السحب
                          child: ClipOval(
                            child: Image.asset(image, width: 50, height: 50, fit: BoxFit.fill),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPencilColumn(
      String label,
      Color color,
      List<String> target,
      List<String> validImages,
      ) {
    return Column(
      children: [
        // رأس القلم المدبب مع اسم اللون
        Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(120, 80),
              painter: PencilTipPainter(color),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                label,
                //textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        // جسم القلم مع الدوائر
        Container(
          width: 90,
          height: 270,
         // color: color,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              return DragTarget<String>(
                builder: (context, accepted, rejected) {
                  return Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: accepted.isNotEmpty ? color.withOpacity(0.3) : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: color, width: 3),
                    ),
                    child: target.length > index
                        ? ClipOval(
                      child: Image.asset(
                        target[index],
                        fit: BoxFit.fill,
                        width: 50,
                        height: 50,
                      ),
                    )
                        : null,
                  );
                },
                onWillAccept: (data) => validImages.contains(data),
                onAccept: (data) {
                  if (!target.contains(data)) {
                    setState(() {
                      target.add(data);
                    });
                    _checkGameCompletion();
                  }
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}

// رسام شكل رأس القلم المدبب
class PencilTipPainter extends CustomPainter {
  final Color color;

  PencilTipPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}