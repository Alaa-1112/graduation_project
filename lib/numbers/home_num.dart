import 'package:flutter/material.dart';
import 'package:kids/numbers/numbers.dart';
class NumberHome extends StatefulWidget {
  const NumberHome({super.key});

  @override
  State<NumberHome> createState() => _NumberHomeState();
}

class _NumberHomeState extends State<NumberHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            colors: [Color(0xFFFEB18F), Colors.yellow[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 320.0,top: 25),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop('');
                },
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Container(
            width: 340,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
              /*gradient: LinearGradient(
                colors: [Colors.blue[200]!, Colors.purpleAccent[100]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),*/
            ),
            child:Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 60),
                    child: Column(
                      children: [
                        Text("مرحبا فاطمة" ,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                        Text("!هيا بنا نتعلم الرياضيات" ,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))
                      ],
                    ),
                  ),
                     Image.asset("assets/images/number.png",height: 150,width: 140,),
                ],
              ),
            ) ,
            ),
          ),

            Padding(
              padding: const EdgeInsets.only(top: 18.0,right: 170),
              child: Text(" محتوى دروسك  ",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Goal(txt: "الارقام", img: "assets/images/alpha_num.png",   onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Numbers(),
                    ),
                  );
                },),
                Goal(txt: "الاشكال", img: "assets/images/shapes.png", onTap: () {  },),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Goal(txt: "الجمع والطرح", img: "assets/images/sum.png", onTap: () {  },),
                Goal(txt: "txt", img: "assets/images/father.png", onTap: () {  },),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Goal extends StatefulWidget {
  const Goal({super.key, required this.txt, required this.img, required this.onTap});
  final String txt;
  final String img;
  final VoidCallback onTap;

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 160,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.img),
            Text(widget.txt,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),)

          ],
        ),
      ),
    );
  }
}

