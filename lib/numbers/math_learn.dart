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
      Nums(num: "١", sound: 'audio/أ.mp3', ),
      Nums(num: "٢", sound: '',),
      Nums(num: "٣", sound: '', ),
      Nums(num: "٤", sound: '', ),
      Nums(num: "٥", sound: '', ),
      Nums(num: "٦", sound: '', ),
      Nums(num: "٧", sound: '',),
      Nums(num: "٨", sound: '',),
      Nums(num: "٩", sound: '', ),
      Nums(num: "١٠", sound: '', ),
      Nums(num: "١١", sound: '', ),
      Nums(num: "١٢", sound: '',),
      Nums(num: "١٣", sound: '', ),
      Nums(num: "١٤", sound: '', ),
      Nums(num: "١٥", sound: '', ),
      Nums(num: "١٦", sound: '', ),
      Nums(num: "١٧", sound: '', ),
      Nums(num: "١٨", sound: '', ),
      Nums(num: "١٩", sound: '',),
      Nums(num: "٢٠", sound: '', ),
      Nums(num: "٢١", sound: '', ),
      Nums(num: "٢٢", sound: '', ),
      Nums(num: "٢٣", sound: '', ),
      Nums(num: "٢٤", sound: '', ),
      Nums(num: "٢٥", sound: '', ),
      Nums(num: "٢٦", sound: '', ),
      Nums(num: "٢٧", sound: '',),
      Nums(num: "٢٨", sound: '', ),
      Nums(num: "٢٩", sound: '', ),
      Nums(num: "٣٠", sound: '',),
      Nums(num: "٣١", sound: '', ),
      Nums(num: "٣٢", sound: '', ),
      Nums(num: "٣٣", sound: '', ),
      Nums(num: "٣٤", sound: '', ),
      Nums(num: "٣٥", sound: '', ),
      Nums(num: "٣٦", sound: '', ),
      Nums(num: "٣٧", sound: '', ),
      Nums(num: "٣٨", sound: '', ),
      Nums(num: "٣٩", sound: '', ),
      Nums(num: "٤٠", sound: '', ),
      Nums(num: "٤١", sound: '', ),
      Nums(num: "٤٢", sound: '',),
      Nums(num: "٤٣", sound: '', ),
      Nums(num: "٤٤", sound: '', ),
      Nums(num: "٤٥", sound: '', ),
      Nums(num: "٤٦", sound: '', ),
      Nums(num: "٤٧", sound: '', ),
      Nums(num: "٤٨", sound: '', ),
      Nums(num: "٤٩", sound: '', ),
      Nums(num: "٥٠", sound: '', ),
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


  Nums({
    required this.num,
    required this.sound,

  });
}


