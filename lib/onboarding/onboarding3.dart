import 'package:flutter/material.dart';

import '../auth/login.dart';
class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/robot3.jpg"),
          Padding(
            padding: const EdgeInsets.only(top: 28.0,left: 12),
            child: Text("مرحبا بك فى عالم المعرفة ايها المبدع الصغير ",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade800,fontSize: 33,fontFamily: 'SpicyRice'),),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Circle(color: Colors.grey),
              SizedBox(width: 20,),
              Circle(color: Colors.grey),
              SizedBox(width: 20,),
              Circle(color: Colors.orange),
            ],
          ),
          SizedBox(height: 120,),
          Container(
            width: double.infinity,
            height: 100,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    onTap:() {
                      Navigator.of(context).pop("onboard2");
                    },
                    child: Text(
                      "الى الخلف",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 25,
                        fontFamily: 'SpicyRice',
                      ),
                    ),
                  ),
                ),
                // Wrap Stack with Flexible to avoid layout issues
                Flexible(
                  fit: FlexFit.loose, // Stack takes only the required space
                  child: Stack(
                    children: [
                      Positioned(
                        left: 210,
                        child: Circle1(color: Colors.orange.shade100, iconButton: null),
                      ),
                      Positioned(
                        right: 20,
                        child: Circle1(color: Colors.orange.shade200, iconButton: null),
                      ),
                      Positioned(
                        right: 40,
                        child: Circle1(color: Colors.orange.shade300, iconButton: null),
                      ),
                      Positioned(
                        right: 60,
                        child: Circle1(
                          color: Colors.orange.shade400,
                          iconButton: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FatherLoginScreen(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_right_alt_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Adding the text beside the stack
                // Add spacing between Stack and Text

              ],
            ),
          )


          // Adding the text "الى الخلف" aligned to the left






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
