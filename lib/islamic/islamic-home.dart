import 'package:flutter/material.dart';
import 'package:kids/islamic/qran.dart';

import 'islamic_morals.dart';

class Islamic extends StatelessWidget {
  const Islamic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // بانر ترحيبي مع صورة
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.png'), // تأكد من إضافة الصورة للمشروع
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'مرحباً بكم',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 3,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // شبكة الأقسام الرئيسية
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildCard(
                    context,
                    title: 'القرآن الكريم',
                    imagePath: 'assets/images/qran.png',
                    onTap: () {
                      Navigator.of(context).push(QuranSurahsScreen() as Route<Object?>);
                    },
                  ),
                  _buildCard(
                    context,
                    title: 'الاّداب الاسلامية',
                    imagePath: 'assets/images/azkar.png',
                    onTap: () {
                      Navigator.of(context).push(IslamicTipsList() as Route<Object?>);
                    },
                  ),
                  _buildCard(
                    context,
                    title: 'قصص الأنبياء',
                    imagePath: 'assets/images/stories.png',
                    onTap: () {
                      // اضافة التنقل لصفحة قصص الأنبياء
                    },
                  ),
                  _buildCard(
                    context,
                    title: 'أنشطة تعليمية',
                    imagePath: 'assets/images/activities.png',
                    onTap: () {
                      // اضافة التنقل لصفحة الأنشطة
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // دالة لبناء كرت كل قسم
  Widget _buildCard(BuildContext context,
      {required String title, required String imagePath, VoidCallback? onTap}) {
    // حساب العرض المناسب للكرت بحيث يظهر عنصرين في الصف على الشاشات العادية
    double cardWidth = (MediaQuery.of(context).size.width - 64) / 2;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // صورة القسم
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            // عنوان القسم
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF61FFF2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}