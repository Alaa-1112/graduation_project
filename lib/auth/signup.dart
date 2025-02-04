import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup > {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _childnameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "الاسم مطلوب.";
    }
    if (!RegExp(r'^[A-Z][a-zA-Z ]*\$').hasMatch(value)) {
      return "يجب أن يبدأ الاسم بحرف كبير.";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "البريد الإلكتروني مطلوب.";
    }
    if (!value.endsWith('@gmail.com')) {
      return "يجب أن ينتهي البريد الإلكتروني بـ @gmail.com.";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return " الرقم السري مطلوب";
    }
    if (value.length < 8) {
      return "يجب أن يكون الرقم السري 8 أحرف على الأقل";
    }
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%^&*()_+]).{8,}\$').hasMatch(value)) {
      return "يجب أن يحتوي الرقم السري على حرف كبير، حرف صغير، رقم وحرف خاص.";
    }
    return null;
  }

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
                    "مرحبا بك معنا ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Field(
                    name: 'اسم ولي الأمر',
                    controller: _nameController,
                    validator: validateName,
                  ),
                  SizedBox(height: 20),
                  Field(
                    name: 'اسم الطفل/ة',
                    controller: _childnameController,
                    validator: validateName, // Assuming same validation for child's name
                  ),
                  SizedBox(height: 20),
                  Field(
                    name: 'البريد الإلكتروني',
                    controller: _mailController,
                    validator: validateEmail,
                  ),
                  SizedBox(height: 20),
                  Field(
                    name: 'الرقم السري',
                    controller: _passController,
                    validator: validatePassword,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {}); // Force UI to refresh and show validation messages
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Container(
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
                              'انشاء حساب',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
    Center(
    child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
    text: 'لديك حساب بالفعل؟ ',
    style: TextStyle(
    color: Colors.black, // اللون الأساسي
    fontSize: 15,
    fontWeight: FontWeight.bold,
    ),
    children: [
    TextSpan(
    text: 'تسجيل دخول',
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
    builder: (context) => LoginScreen(), // صفحتك المستهدفة
    ),
    );
    },
    ),
    ],
    ),
    ))]),
                    ),

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


