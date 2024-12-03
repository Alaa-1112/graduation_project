import 'package:flutter/material.dart';

import 'animal2.dart';

class Animal1 extends StatefulWidget {
  const Animal1({super.key});

  @override
  State<Animal1> createState() => _Animal1State();
}

class _Animal1State extends State<Animal1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/forest1.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 30,
              child: Forest(
                img: "assets/images/monkey.png",
                Name: 'Monkey',
                sound: 'audio/أ.mp3',
                width: 100,
                height: 100, image:  'assets/animation/monkey.json', Name1: 'قرد',
              ),
            ),
            Positioned(
              top: 280,
              right: 40,
              child: Forest(
                img: "assets/images/tiger.png",
                Name: 'Tiger',
                sound: '',
                width: 90,
                height: 90,
                image: 'assets/animation/tiger.json', Name1: 'نمر',
              ),
            ),
            Positioned(
              top: 360,
              right: 240,
              child: Forest(
                img: "assets/images/زرافة.png",
                Name: 'Giraffe',
                sound: '',
                width: 200,
                height: 200, image:  'assets/animation/tiger.json', Name1: 'زرافة',
              ),
            ),
            Positioned(
              top: 420,
              right: 30,
              child: Forest(
                img: "assets/images/rabbit.png",
                Name: 'Rabbit',
                sound: '',
                width: 90,
                height: 90, image:  'assets/animation/tiger.json', Name1: 'أرنب',
              ),
            ),
            Positioned(
              bottom: 200,
              left: 140,
              child: Forest(
                img: "assets/images/derr.png",
                Name: 'Deer',
                sound: '',
                width: 150,
                height: 150, image:  'assets/animation/tiger.json', Name1: 'غزالة',
              ),
            ),
            Positioned(
              bottom: 30,
              right: 140,
              child: Forest(
                img: "assets/images/فيل.png",
                Name: 'Elephant',
                sound: '',
                width: 180,
                height: 180, image:  'assets/animation/tiger.json', Name1: 'فيل',
              ),
            ),
            Positioned(
              top: 270,
              right: 300,
              child: Forest(
                img: "assets/images/lion2.png",
                Name: 'Lion',
                sound: '',
                width: 90,
                height: 90, image: 'assets/animation/lion.json', Name1: 'أسد',
              ),
            ),
            Positioned(
              bottom: 170,
              left: 280,
              child: Forest(
                img: "assets/images/كلب.png",
                Name: 'Dog',
                sound: '',
                width: 100,
                height: 100, image: 'assets/animation/dog.json', Name1: 'كلب',
              ),
            ),

            Positioned(
              top: 370,
              left: 130,
              child: Forest(
                img: "assets/images/zebra.png",
                Name: 'Zebra',
                sound: '',
                width: 90,
                height: 90, image:  'assets/animation/tiger.json', Name1: 'حمار وحشى',
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: Forest(
                img: "assets/images/cat.png",
                Name: 'Cat',
                sound: '',
                width: 90,
                height: 90, image:  'assets/animation/cat.json', Name1: 'قطة',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Forest extends StatefulWidget {
  const Forest({
    super.key,
    required this.img,
    required this.Name,
    required this.sound,
    required this.width,
    required this.height, required this.image, required this.Name1,
  });

  final String img;
  final String Name;
  final String Name1;
  final String sound;
  final double width;
  final double height;
  final String image;

  @override
  State<Forest> createState() => _ForestState();
}

class _ForestState extends State<Forest> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Animaldetails(
              image: widget.img,
              Name: widget.Name,
              sound: widget.sound,
              Name1: widget.Name1,
            ),
          ),
        );
      },
      child: Image.asset(
        widget.img,
        fit: BoxFit.fill,
        height: widget.height,
        width: widget.width,
      ),
    );
  }
}
