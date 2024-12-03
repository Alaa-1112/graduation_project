import 'package:flutter/material.dart';
import 'package:kids/numbers/number_detail.dart';

class LearnMath extends StatefulWidget {
  const LearnMath({super.key});

  @override
  State<LearnMath> createState() => _LearnMathState();
}

class _LearnMathState extends State<LearnMath> {
  @override
  Widget build(BuildContext context) {
    List<Nums> numbers = [
      Nums(num: "١", sound: 'audio/أ.mp3', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢", sound: '', image: 'assets/images/parrot.png', backimg:  'assets/images/garden.jpg'),
      Nums(num: "٣", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٥", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٦", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٧", sound: '',image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٨", sound: '',image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٩", sound: '', image: 'assets/images/parrot.png', backimg:  'assets/images/garden.jpg'),
      Nums(num: "١٠", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "١١", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "١٢", sound: '',image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "١٣", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "١٤", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "١٥", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "١٦", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "١٧", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "١٨", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "١٩", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢٠", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢١", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢٢", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢٣", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢٤", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢٥", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢٦", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢٧", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢٨", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٢٩", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣٠", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣١", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣٢", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣٣", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣٤", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣٥", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣٦", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣٧", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣٨", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٣٩", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤٠", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤١", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤٢", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤٣", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤٤", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤٥", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤٦", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤٧", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤٨", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٤٩", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
      Nums(num: "٥٠", sound: '', image: 'assets/images/parrot.png', backimg: 'assets/images/garden.jpg'),
    ];

    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 320.0, top: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: numbers
                    .map(
                      (num) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Numdetail(
                            num: num.num,
                            sound: num.sound,
                            image: num.image,
                            backimg: num.backimg,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xFFFEB18F),
                      child: Center(
                        child: Text(
                          num.num,
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Nums {
  final String num;
  final String sound;
  final String image;
  final String backimg;

  Nums({
    required this.num,
    required this.sound,
    required this.image,
    required this.backimg,
  });
}


