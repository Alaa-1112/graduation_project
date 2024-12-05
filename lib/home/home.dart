import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids/home/profile.dart';
import 'package:kids/home/profile_image.dart';
import 'package:kids/home/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../alphapets/arabic.dart';
import '../alphapets/english.dart';
import '../animals/animal1.dart';
import '../animals/splash.dart';
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
      "color": "8E97FD",
      "text_color": "FFECCC",
      "page": ArabicAlphabetsPage(),  // Link to Arabic page
    },
    {
      "image": "assets/images/english.png",
      "title": "اللغة الانجليزية",
      "color": "FA6E5A",
      "text_color": "FFECCC",
      "page": EnglishAlphabetsPage(),  // Link to English page
    },
    {
      "image": "assets/images/numbers.png",
      "title": "الرياضيات",
      "color": "FEB18F",
      "text_color": "FFECCC",
      "page": NumberHome(),  // Link to Numbers page
    },
    {
      "image": "assets/images/animal.png",
      "title": "الحيوانات",
      "color": "FFCF86",
      "text_color": "FFECCC",
      "page":  Animal1(),  // Link to Animals page
    },
    {
      "image": "assets/images/colors.png",
      "title": "الالوان",
      "color": "F2E266",
      "text_color": "FFECCC",
    },
    {
      "image": "assets/images/stories.png",
      "title": "القصص",
      "color": "F79131",
      "text_color": "FFECCC",
      "page": Story(),
    },
    {
      "image": "assets/images/eslam.png",
      "title": "الدين الاسلامى",
      "color": "C18863",
      "text_color": "FFECCC",
    },
    {
      "image": "assets/images/quiz.png",
      "title": "ألغاز",
      "color": "C749B4",
      "text_color": "FFECCC",
    },
    // Add more categories here...
  ];

  /*File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profileImage');
    if (imagePath != null) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }*/

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
                  child:ValueListenableBuilder<File?>(
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
                        color: HexColor.fromHex(item["color"]),
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
  HexColor(final int hexColor) : super(hexColor);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

