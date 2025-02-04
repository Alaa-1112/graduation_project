/*import 'package:flutter/material.dart';
class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30) ,bottomRight: Radius.circular(30),
                ),
                color: Colors.orange,
              ),
              child: Image.asset("assets/images/art1.jpg",fit: BoxFit.fill,),
            ),
            GradientText(
              'Select any color you want',
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.pink,
                  Colors.purpleAccent,
                ],
              ),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'SpicyRice'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Circle(color: Colors.red, color1: Colors.red.shade600,),
                Circle(color: Colors.green, color1: Colors.green.shade600,),
                Circle(color: Colors.yellowAccent, color1: Colors.yellowAccent.shade400,),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Circle(color: Colors.blue, color1: Colors.blue.shade500,),
                Circle(color: Colors.orange, color1: Colors.orange.shade400,),
                Circle(color: Colors.purpleAccent, color1: Colors.purpleAccent.shade400,),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Circle(color: Colors.pink, color1: Colors.pink.shade500,),
                Circle(color: Colors.brown, color1: Colors.brown.shade500),
                Circle(color: Colors.black, color1: Colors.black12,),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Circle(color: Colors.purple, color1: Colors.purple.shade500,),
                Circle(color: Colors.lightGreenAccent, color1:Colors.lightGreenAccent.shade400 ,),
                Circle(color: Colors.lightBlue, color1: Colors.lightBlue.shade500,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





class Circle extends StatefulWidget {
  const Circle({super.key, required this.color, required this.color1});
  final Color color;
  final Color color1;
  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80, // Diameter of the circle
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Makes the container circular
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: widget.color1.withOpacity(0.6), // Shadow color
              blurRadius: 10, // Blur effect
              spreadRadius: 2, // Spread of the shadow
              offset: const Offset(4, 4), // X and Y offset of the shadow
            ),
          ],
        ),
      ),
    );
  }
}



class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(this.text, {super.key, required this.gradient, required this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        style: style.copyWith(color: Colors.white), // The color here acts as a fallback
      ),
    );
  }
}*/


import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _topAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _topAnimation = Tween<double>(begin: -150, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward(); // بدء الأنيميشن
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
                  padding: const EdgeInsets.only(right: 350.0, top: 30),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop('');
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
                  ),
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: _topAnimation.value,
                left: MediaQuery.of(context).size.width / 2 - 150,
                child: child!,
              );
            },
            child: Image.asset(
              "assets/images/pallons.png",
              width: 300,
              height: 400,
            ),
          ),
          Center(
            child: Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              alignment: WrapAlignment.center,
              children: colors.map((color) {
                return buildCrayonContainer(color);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCrayonContainer(Color color) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        Image.asset(
          "assets/images/blue_crayon.png",
          width: 60,
          height: 150,
          color: color,  // This sets the color of the crayon
        ),
      ],
    );
  }

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
  ];
}



