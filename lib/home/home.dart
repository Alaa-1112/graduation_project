import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids/home/profile.dart';
import 'package:kids/home/profile_image.dart';
import 'package:kids/home/setting.dart';
import 'package:kids/islamic/islamic-home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


import '../animals/animal1.dart';
import '../animals/home_alimant.dart';
import '../animals/splash.dart';
import '../arabic/arabic.dart';
import '../english/english.dart';
import '../colors/page_color.dart';
import '../habits/home.dart';
import '../numbers/home_num.dart';
import '../story/story.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> dataArr = [
    {
      "image": "assets/images/arabic.png",
      "title": "اللغة العربية",
      "color": "0CF2EE",
      "text_color": "FDFDFD",
      "page": ArabicAlphabetsPage(), // Link to Arabic page
      "gradient": [
        "0CF2EE", // اللون الأول
        "EAF2DC", // اللون الثاني
      ],
    },
    {
      "image": "assets/images/abc.png",
      "title": "اللغة الانجليزية",
      "color": "4DBBB2",
      "text_color": "FDFDFD",
      "page": EnglishAlphabetsPage(),
      "gradient": [
        "92F3E1", // اللون الأول
        "E8DC9D", // اللون الثاني
      ],// Link to English page
    },
    {
      "image": "assets/images/numbers.png",
      "title": "الرياضيات",
      "color": "45FFD4",
      "text_color": "FDFDFD",
      "page": NumberHome(),
      "gradient": [
        "45FFD4", // اللون الأول
        "F7BBBC", // اللون الثاني
      ],// Link to Numbers page
    },
    {
      "image": "assets/images/animal.png",
      "title": "الحيوانات",
      "color": "BAF6F0",
      "text_color": "FDFDFD",
      "page": Homeanimals(),
      "gradient": [
        "BAF6F0", // اللون الأول
        "B2F6C3", // اللون الثاني
      ],// Link to Animals page
    },
    {
      "image": "assets/images/colors.png",
      "title": "الالوان",
      "color": "86FEE8",
      "text_color": "FDFDFD",
      "page": ColorPage(),
      "gradient": [
        "86FEE8", // اللون الأول
        "DCE6F2", // اللون الثاني
      ],
    },
    {
      "image": "assets/images/stories.png",
      "title": "القصص",
      "color": "45FFD4",
      "text_color": "FDFDFD",
      "page": Story(),
    },
    {
      "image": "assets/images/eslam.png",
      "title": "الدين الاسلامى",
      "page": Islamic(),
      "color": "61FFF2",
      "text_color": "FDFDFD",
      "gradient": [
        "61FFF2", // اللون الأول
        "F6E6B9", // اللون الثاني
      ],
    },
    {
      "image": "assets/images/quiz.png",
      "title": "ألغاز",
      "color": "63DBD1",
      "text_color": "FDFDFD",
      "gradient": [
        "63DBD1", // اللون الأول
        "DAF6B9", // اللون الثاني
      ],
    },
    {
      "image": "assets/images/habits.png",
      "title": "عادات مفيدة",
      "page" : Habit(),
      "color": "86FFF5",
      "text_color": "FDFDFD",
      "gradient": [
        "86FFF5", // اللون الأول
        "F6A8CC", // اللون الثاني
      ],
    },
    // Add more categories here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  },
                  child: ValueListenableBuilder<File?>(
                    valueListenable: homeImageNotifier,
                    builder: (context, imageFile, child) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: imageFile != null
                              ? FileImage(imageFile)
                              : AssetImage('assets/images/default.png') as ImageProvider,
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Setting(),
                      ),
                    );
                  },
                  icon: Icon(Icons.settings, color: Colors.grey[800], size: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 220.0),
            child: Text(
              "مرحبا فاطمة",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Expanded(
            child: MasonryGridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemCount: dataArr.length,
              itemBuilder: (context, index) {
                final item = dataArr[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the corresponding page based on the item
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => item["page"],
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: item["gradient"] != null
                            ? LinearGradient(
                          colors: [
                            HexColor.fromHex(item["gradient"][0]), // اللون الأول
                            HexColor.fromHex(item["gradient"][1]), // اللون الثاني
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        )
                            : null,
                        color: item["gradient"] == null ? HexColor.fromHex(item["color"]) : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            item["image"],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item["title"],
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: HexColor.fromHex(item["text_color"]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // Add opacity if not provided
    }
    return int.parse(hexColor, radix: 16);
  }

  // تعريف دالة fromHex بشكل صحيح
  static Color fromHex(String hexColor) {
    return HexColor(hexColor);
  }
}

