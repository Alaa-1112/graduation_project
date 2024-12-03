import 'package:flutter/material.dart';
import 'package:kids/animals/animal1.dart';
import 'package:kids/auth/child_login.dart';
import 'package:kids/home/home.dart';
import 'package:kids/numbers/numbers.dart';
import 'package:kids/onboarding/onboarding1.dart';
import 'package:kids/onboarding/onboarding2.dart';
import 'package:kids/story/story.dart';

import 'animals/lottie.dart';
import 'animals/splash.dart';
import 'alphapets/arabic.dart';
import 'colors/page_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  Home(),
      routes: {
        "story": (context) => Story(),
        "animal1": (context) => Animal1(),
        "animals": (context) => SplashScreen(),
        "animal" : (context) => Animal1(),
        "onboarding1" : (context) => Onboarding1(),
        "onboarding2" : (context) => Onboarding2(),
        "childlogin" : (context) => ChildLoginScreen(),
        "home" : (context) => Home(),
        "numbers" : (context) => Numbers(),
      }
    );
  }
}



