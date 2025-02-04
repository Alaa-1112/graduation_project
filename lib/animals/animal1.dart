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
              top: 30,
                left: 6,
                child: IconButton( onPressed: () {
                 Navigator.of(context).pop('');
                       },
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,))),
            Positioned(
              top: 40,
              left: 30,
              child: Forest(
                img: "assets/images/monkey.png",
                Name: 'Monkey',
                sound: 'audio/أ.mp3',
                width: 100,
                height: 100, image:  'assets/images/monkk.jpg',
                Name1: 'قرد',
                nameColor: Colors.brown.shade800,
                name1Top: 250,
                name1Left: 150,
                nameTop: 330,
                nameLeft: 70,
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
                image: 'assets/images/tiger_life.jpg',
                Name1: 'نمر',
                nameColor:Colors.brown,
                name1Top: 220,
                name1Left: 200,
                nameTop: 330,
                nameLeft: 160,
              ),
            ),
            Positioned(
              top: 300,
              right: 200,
              child: Forest(
                img: "assets/images/fox1.png",
                Name: 'Fox',
                sound: '',
                width: 90,
                height: 90,
                image: 'assets/images/fox_life.jpg',
                Name1: 'ثعلب',
                nameColor: Colors.brown.shade800,
                name1Top: 310,
                name1Left: 10,
                nameTop: 400,
                nameLeft:30,
              ),
            ),
            Positioned(
              top: 550,
              right: 290,
              child: Forest(
                img: "assets/images/peacock.png",
                Name: 'Peacock',
                sound: '',
                width: 120,
                height: 120,
                image: 'assets/images/peacock_life.jpg',
                Name1: 'طاووس',
                nameColor: Colors.black,
                name1Top: 280,
                name1Left: 100,
                nameTop: 400,
                nameLeft: 80,
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
                height: 200, image:  'assets/images/gira.jpg',
                Name1: 'زرافة',
                nameColor: Colors.brown.shade800,
                name1Top: 350,
                name1Left: 20,
                nameTop: 480,
                nameLeft: 10,
              ),
            ),
            Positioned(
              top: 60,
              right: 10,
              child: Forest(
                img: "assets/images/ببغاء.png",
                Name: 'Parrot',
                sound: '',
                width: 70,
                height: 70, image:  'assets/images/parr_life.jpg', Name1: 'ببغاء',
                nameColor: Colors.red,
                name1Top: 430,
                name1Left: 70,
                nameTop: 510,
                nameLeft: 40,
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
                height: 90, image:  'assets/images/rabbit_life.jpg', Name1: 'أرنب',
                nameColor: Colors.black,
                name1Top: 90,
                name1Left: 70,
                nameTop: 190,
                nameLeft: 50,
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
                height: 150, image:  'assets/images/derr_life.jpg', Name1: 'غزالة',
                nameColor: Colors.pink,
                name1Top: 200,
                name1Left: 20,
                nameTop: 300,
                nameLeft: 20,
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
                height: 180, image:  'assets/images/eleph_life.jpg', Name1: 'فيل',
                nameColor: Colors.blueGrey.shade700,
                name1Top: 90,
                name1Left: 170,
                nameTop: 200,
                nameLeft: 80,
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
                height: 90, image: 'assets/images/lionn_life.jpg', Name1: 'أسد',
                nameColor: Colors.brown,
                name1Top: 120,
                name1Left: 200,
                nameTop: 200,
                nameLeft: 200,
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
                height: 100, image: 'assets/images/dog_life.jpg', Name1: 'كلب',
                nameColor: Colors.white,
                name1Top: 200,
                name1Left: 70,
                nameTop: 290,
                nameLeft: 70,
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
                height: 90, image:  'assets/images/zebra_life.jpg', Name1: 'حمار وحشى',
                nameColor: Colors.black,
                name1Top: 100,
                name1Left: 70,
                nameTop: 200,
                nameLeft: 140,
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
                height: 90, image:  'assets/images/catt_life.jpg', Name1: 'قطة',
                nameColor: Colors.white,
                name1Top: 130,
                name1Left: 30,
                nameTop: 220,
                nameLeft: 40,
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
    required this.height, required this.image, required this.Name1, required this.nameColor, required this.name1Top, required this.name1Left, required this.nameTop, required this.nameLeft,
  });

  final String img;
  final String Name;
  final String Name1;
  final String sound;
  final double width;
  final double height;
  final String image;
  final Color nameColor;
  final double name1Top;
  final double name1Left;
  final double nameTop;
  final double nameLeft;

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
             // image: widget.img,
              Name: widget.Name,
              sound: widget.sound,
              Name1: widget.Name1,
              bimage: widget.image,
              nameColor: widget.nameColor,
              name1Top: widget.name1Top,
              name1Left: widget.name1Left,
              nameTop: widget.nameTop,
              nameLeft: widget.nameLeft,
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
