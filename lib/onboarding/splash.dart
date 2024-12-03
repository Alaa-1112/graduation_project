import 'package:flutter/material.dart';
import 'package:kids/onboarding/onboarding1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _moveToCenter = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _moveToCenter = true;
      });
    });

    // Navigate to the second page after 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 3),
            curve: Curves.easeInOut,
            bottom: _moveToCenter ? MediaQuery.of(context).size.height / 2 - 100 : 0,
            left: MediaQuery.of(context).size.width/2 -200,
            child: Image.asset(
              'assets/images/smart.png',
              width: 400,
              height: 400,
            ),
          ),
        ],
      ),
    );
  }
}

