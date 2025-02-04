import 'package:flutter/material.dart';
import 'package:kids/habits/care-dog.dart';
import 'package:kids/habits/clean.dart';

// استيراد الصفحات (تأكد من أن المسارات صحيحة)
import 'package:kids/habits/sleep.dart';
import 'package:kids/habits/sports.dart';
import 'package:kids/habits/tooth%20brush.dart';
 // تأكد من أن اسم الملف صحيح
import 'food.dart';
import 'hands.dart';

class Habit extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      'text': 'غسيل الاسنان',
      'icon': 'assets/animation/teeth.gif', // صورة إضافية
      'page': BrushingBuddyScreen(), // اسم الصفحة
    },
    {
      'text': 'غسيل اليد',
      'icon': 'assets/animation/wash-hands.gif', // صورة إضافية
      'page': HandWashingPage(), // اسم الصفحة
    },
    {
      'text': 'الطعام الصحى',
      'icon': 'assets/animation/fruit.gif', // صورة إضافية
      'page': Food(), // اسم الصفحة
    },
    {
      'text': 'النوم والاستيقاظ مبكرا',
      'icon': 'assets/animation/alarm.gif', // صورة إضافية
      'page': Sleep(), // اسم الصفحة
    },
    {
      'text': 'ممارسة الرياضة',
      'icon': 'assets/animation/gym.gif', // صورة إضافية
      'page': sports(), // اسم الصفحة
    },
    {
      'text': 'النظام والترتيب',
      'icon': 'assets/animation/clean.gif', // صورة إضافية
      'page': clean(), // اسم الصفحة
    },
    {
      'text': 'الرفق بالحيوان',
      'icon': 'assets/animation/girl-dog.gif', // صورة إضافية
      'page': KindnessToAnimalsApp(), // اسم الصفحة
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  title: Text('Habit Tracker'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          final isLeftAligned = index % 2 == 0; // تحديد مكان العنصر بين اليسار واليمين

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment:
              isLeftAligned ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                Content(
                  txt: item['text']!,
                  img: item['icon']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => item['page'], // فتح الصفحة
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.txt,
    required this.img,
    required this.onTap,
  });

  final String txt;
  final String img;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280, // تحديد عرض ثابت
        height: 180, // تحديد ارتفاع ثابت
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          gradient: const LinearGradient(
            colors: [Color(0xFF86FFF5), Color(0xFFF6A8CC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  txt,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SpicyRice",
                  ),
                ),
              ),
            ),
            Image.asset(
              img,
              width: 120,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Habit(),
  ));
}