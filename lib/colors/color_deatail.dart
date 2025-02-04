import 'package:flutter/material.dart';
class Colordetail extends StatefulWidget {
  const Colordetail({super.key, required this.txt1, required this.txt2, required this.img, required this.soundUrl});
  final String txt1;
  final String txt2;
  final String img;
  final String soundUrl;

  @override
  State<Colordetail> createState() => _ColordetailState();
}

class _ColordetailState extends State<Colordetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
