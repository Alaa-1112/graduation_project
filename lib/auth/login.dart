import 'package:flutter/material.dart';

import 'child_login.dart';

class FatherLoginScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange[300]!, Colors.yellow[100]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/father.png'),  // صورة كرتونية
                  Text("تسجيل الدخول للأهل",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                //  Image.asset('assets/images/father.png'),  // صورة كرتونية
                  SizedBox(height: 20),
                  Field(name: 'اسم الاب', controller:_nameController ,),
                  SizedBox(height: 20),
                  Field(name: 'البريد الالكترونى', controller: _mailController ,),
                  SizedBox(height: 20),
                  Field(name: 'الرقم السرى', controller:_passController ,),
                  SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChildLoginScreen(),
                          ),
                        );
                      },

              child: Container(
                  width: 220,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.orange[200]!, Colors.redAccent[100]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),

                      /*onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChildLoginScreen(),
                          ),
                        );
                      },*/
                      child: Text('تسجيل الدخول',textAlign: TextAlign.center ,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold))),
              ) ,

                ],
              ),
            ),
          ),
        ),

    );
  }
}


class Field extends StatelessWidget {
  const Field({super.key, required this.name, required this.controller});
  final String name;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller,
      decoration: InputDecoration(
        labelText: name,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular (30)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.white), // Border color when not focused
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.white, width: 4), // Border color when focused
        ),
      ),
    );
  }
}
