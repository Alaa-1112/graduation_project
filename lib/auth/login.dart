import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kids/auth/signup.dart';

import '../home/home.dart';
import 'login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 // final TextEditingController _nameController = TextEditingController();
  final TextEditingController _childnameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
 // final TextEditingController _passController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey, // Form key for validation
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                    height: 250,
                    width: 250,
                  ),
                  Text(
                    "اهلا بك من جديد",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  Field(
                    name: 'اسم الطفل/ة',
                    controller: _childnameController,
                  ),
                  SizedBox(height: 20),
                  Field(
                    name: 'البريد الإلكتروني',
                    controller: _mailController,
                  ),
                  SizedBox(height: 40),

                     Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => Home (), // صفحتك المستهدفة
                              ));
                            },
                            child: Container(
                              width: 220,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(
                                  colors: [Color(0xFF45FFD4), Color(0xFFF7BBBC)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'تسجيل الدخول',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'ليس لديك حساب؟',
                                  style: TextStyle(
                                    color: Colors.black, // اللون الأساسي
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'تسجيل حساب جديد',
                                      style: TextStyle(
                                        color: Color(0xFF45FFD4), // اللون المختلف
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Signup (), // صفحتك المستهدفة
                                            ),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ))]),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.name,
    required this.controller,
    this.validator,
  });

  final String name;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator, // Assign validator to the field
      decoration: InputDecoration(
        labelText: name,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Color(0xFF45FFD4)), // Border color when not focused
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Color(0xFF45FFD4), width: 2), // Border color when focused
        ),
      ),
    );
  }
}
