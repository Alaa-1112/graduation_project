import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الأداب الإسلامية',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Amiri',
      ),
      home: IslamicTipsList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// تعريف الكلاس بشكل صحيح هنا
class IslamicTip {
  final String title;
  final String audioFile;

  IslamicTip({required this.title, required this.audioFile});
}

class IslamicTipsList extends StatefulWidget {
  @override
  _IslamicTipsListState createState() => _IslamicTipsListState();
}

class _IslamicTipsListState extends State<IslamicTipsList>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 5,
            top: 25,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            top: 40,
            left: 5,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/animation/wave.gif'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}




