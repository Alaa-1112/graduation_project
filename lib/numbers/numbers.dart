import 'package:flutter/material.dart';
import 'package:kids/numbers/quiz_math.dart';

import 'math_learn.dart';

class Numbers extends StatefulWidget {
  const Numbers({super.key});

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _topAnimation;
  late Animation<double> _bottomAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;

      setState(() {
        // الأنيميشن الأول للصورة التي تتحرك من أعلى لأسفل
        _topAnimation = Tween<double>(begin: -150, end: 50).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        );

        // الأنيميشن الثاني للصورة التي تتحرك من اليسار لليمين
        _bottomAnimation = Tween<double>(begin: -200, end: screenWidth + 50).animate(
          CurvedAnimation(parent: _controller, curve: Curves.linear),
        );

        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            // إعادة تشغيل الأنيميشن من البداية
            _controller.reset();
            _controller.forward();
          }
        });

        _controller.forward(); // بدء الأنيميشن
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 320.0, top: 30),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop('');
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 150),
                Content(
                  txt: "تعلم معنا الارقام",
                  img: "assets/images/learn_num.png",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LearnMath(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                Content(
                  txt: "تمارين ممتعة",
                  img: "assets/images/math_quiz.png",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MathQuizApp(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // صورة متحركة من أعلى لأسفل
          AnimatedBuilder(
            animation: _topAnimation,
            builder: (context, child) {
              return Positioned(
                top: _topAnimation.value,
                left: MediaQuery.of(context).size.width / 2 - 90, // وضع الصورة في المنتصف أفقيًا
                child: child!,
              );
            },
            child: Image.asset(
              "assets/images/num_fly.png",
              width: 200,
              height: 200,
            ),
          ),
          // صورة متحركة من اليسار لليمين
          AnimatedBuilder(
            animation: _bottomAnimation,
            builder: (context, child) {
              return Positioned(
                bottom: 20,
                left: _bottomAnimation.value,
                child: child!,
              );
            },
            child: Image.asset(
              "assets/images/train.png",
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.txt,
    required this.img,
    required this.onTap,
  });
  final String txt;
  final String img;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 360,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            colors: [Color(0xFFFEB18F), Colors.yellow[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  txt,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SpicyRice",
                  ),
                ),
              ),
            ),
            Image.asset(
              img,
              width: 170,
              height: 190,
            ),
          ],
        ),
      ),
    );
  }
}



