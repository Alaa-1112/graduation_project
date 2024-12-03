import 'package:flutter/material.dart';
import 'package:kids/onboarding/onboarding2.dart';
class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/robot.jpg"),
           Padding(
             padding: const EdgeInsets.only(top: 28.0,left: 12),
             child: Text("مرحبا بك فى عالم المعرفة ايها المبدع الصغير ",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade800,fontSize: 33,fontFamily: 'SpicyRice'),),
           ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Circle(color: Colors.orange),
              SizedBox(width: 20,),
              Circle(color: Colors.grey),
              SizedBox(width: 20,),
              Circle(color: Colors.grey),
            ],
          ),
          SizedBox(height: 120,),
          Container(
            width: double.infinity,
            height: 100,
            child: Stack(
              children: [
                Positioned(
                    left: 310,
                    child: Circle1(color: Colors.orange.shade100, iconButton: null, )),
                Positioned(
                 right: 20,
                    child: Circle1(color: Colors.orange.shade200, iconButton: null,)),
                Positioned(
                    right: 40,
                    child: Circle1(color: Colors.orange.shade300, iconButton: null, )),
                Positioned(
                    right: 60,
                    child: Circle1(color: Colors.orange.shade400, iconButton:IconButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboarding2(),
                        ),
                      );
                    }, icon: Icon(Icons.arrow_right_alt_outlined,size: 50,color: Colors.white,)),)),
              ],
            ),
          )

        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: color,
    );
  }
}


class Circle1 extends StatelessWidget {
  const Circle1({super.key, required this.color,  required this.iconButton});
  final Color color;
  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: color,
      child: iconButton ?? const SizedBox.shrink(),
    );
  }
}

