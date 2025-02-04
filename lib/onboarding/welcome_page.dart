import 'package:flutter/material.dart';

import '../auth/login.dart';
import '../auth/signup.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  List<String> images = ["on4.png", "on3.png", "on2.png"];
  final PageController _pageController = PageController(); // للتحكم في PageView
  int _currentPage = 0; // لمعرفة الصفحة الحالية

  @override
  void dispose() {
    _pageController.dispose(); // تحرير الموارد عند إنهاء الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController, // ربط PageController بـ PageView
            onPageChanged: (index) {
              setState(() {
                _currentPage = index; // تحديث الصفحة الحالية
              });
            },
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/" + images[index]),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.65,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(
                                text: "مرحبا بك أيها المبدع الصغير",
                                color: const Color(0xFFD45125),
                              ),
                            ],
                          ),
                          /*Column(
                            children: List.generate(3, (indexDots) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 3),
                                width: 8,
                                height: index == indexDots ? 30 : 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots
                                      ? const Color(0xFF45FFD4)
                                      : const Color(0xFF45FFD4).withOpacity(.2),
                                ),
                              );
                            }),
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // الزر يظهر فقط في الصفحة الأخيرة
          if (_currentPage == images.length - 1)
            Positioned(
              bottom: 30, // مسافة من أسفل الشاشة
              right: 20, // مسافة من يمين الشاشة
              child: SizedBox(
                width: 150, // عرض منطقة الدوائر بالكامل
                height: 120, // ارتفاع منطقة الدوائر بالكامل
                child: Stack(
                  children: [
                   /* Positioned(
                      right: 0,
                      bottom: 20,
                      child: Circle1(color: Colors.orange.shade100, iconButton: null),
                    ),*/
                    Positioned(
                      right:0,
                      bottom: 20,
                      child: Circle1(color: Color(0xFF45FFD4).withOpacity(.3), iconButton: null),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 20,
                      child: Circle1(color: Color(0xFF45FFD4).withOpacity(.6), iconButton: null),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: Circle1(
                        color: Color(0xFF45FFD4).withOpacity(.8),
                        iconButton: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen (),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )

        ],
      ));
  }
}












    class AppLargeText extends StatelessWidget {
  const AppLargeText({super.key, required this.text,  required this.color , this.size =32});
  final double size;
  final String text;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: size,fontWeight: FontWeight.bold),);
  }
}


class Circle extends StatelessWidget {
  const Circle({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
     // radius:20,
      backgroundColor: color,
    );
  }
}


class Circle1 extends StatelessWidget {
  const Circle1({super.key, required this.color,  required this.iconButton});
  final Color color;
  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: color,
      child: iconButton ?? const SizedBox.shrink(),
    );
  }
}

