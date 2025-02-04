import 'package:flutter/material.dart';
import 'package:kids/animals/animal1.dart';
import 'package:kids/auth/login.dart';
import 'package:kids/home/home.dart';
import 'package:kids/islamic/islamic-home.dart';
import 'package:kids/numbers/numbers.dart';

import 'package:kids/story/story.dart';
import 'package:kids/theme/light.dart';
import 'package:kids/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'animals/splash.dart';
import 'colors/page_color.dart';
import 'colors/paint.dart';
import 'habits/clean.dart';
import 'habits/hands.dart';
import 'habits/sleep.dart';
import 'habits/tooth brush.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(Themes.light),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ValueNotifier<bool> isDarkTheme = ValueNotifier<bool>(false);
  //const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child){

          return MaterialApp(

            /*localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],*/
            /* routes: {
    'Between': (context) => Between(),
    // Other routes...
  },*/

              debugShowCheckedModeBanner: false,

              theme: themeProvider.themeData,
      home:Story(),

      routes: {
        "story": (context) => Story(),
        "animal1": (context) => Animal1(),
        "animals": (context) => SplashScreen(),
        "animal" : (context) => Animal1(),
        "home" : (context) => Home(),
        "numbers" : (context) => Numbers(),
      });
        });
  }
}



