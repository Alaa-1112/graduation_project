import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids/arabic/letter-details.dart';

void main() {
  runApp(const ArabicLettersApp());
}

class ArabicLettersApp extends StatelessWidget {
  const ArabicLettersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArabicLettersScreen(),
    );
  }
}

class ArabicLettersScreen extends StatefulWidget {
  @override
  _ArabicLettersScreenState createState() => _ArabicLettersScreenState();
}

class _ArabicLettersScreenState extends State<ArabicLettersScreen> {
  final FlutterTts flutterTts = FlutterTts();

  final List<Map<String, dynamic>> letters = [
    {
      'letter': "أ",
      'beginning': "أ",
      'middle': "أ",
      'end': "ا",
      'words': ['أسد', 'فأر', 'عصا'],
    },
    {
      'letter': 'ب',
      'beginning': 'بـ',
      'middle': 'ـبـ',
      'end': 'ـب',
      'words': ['باب', 'جبل', 'كتاب'],
    },
    {
      'letter': 'ت',
      'beginning': 'تـ',
      'middle': 'ـتـ',
      'end': 'ـت',
      'words': ['تفاحة', 'زيتون', 'بيت'],
    },
    {
      'letter': 'ث',
      'beginning': 'ثـ',
      'middle': 'ـثـ',
      'end': 'ـث',
      'words': ['ثعلب', 'كمثرى', 'غيث'],
    },
    {
      'letter': 'ج',
      'beginning': 'جـ',
      'middle': 'ـجـ',
      'end': 'ـج',
      'words': ['ثعلب', 'كمثرى', 'غيث'],
    },
    {
      'letter': 'ح',
      'beginning': 'حـ',
      'middle': 'ـحـ',
      'end': 'ـح',
      'words': ['حصان', 'سحاب', 'تمساح'],
    },
    {
      'letter': 'خ',
      'beginning': 'خـ',
      'middle': 'ـخـ',
      'end': 'ـخ',
      'words': ['خروف', 'اختى', 'خوخ'],
    },
    {
      'letter': 'د',
      'beginning': 'دـ',
      'middle': 'ـدـ',
      'end': 'ـد',
      'words': ['ديك', 'جريدة', 'ورد'],
    },

    {
      'letter': 'ذ',
      'beginning': 'ذـ',
      'middle': 'ـذـ',
      'end': 'ـذ',
      'words': ['ذئب', 'كتاب', 'حليب'],
    },

    {
      'letter': 'ر',
      'beginning': 'رـ',
      'middle': 'ـرـ',
      'end': 'ـر',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ز',
      'beginning': 'زـ',
      'middle': 'ـزـ',
      'end': 'ـز',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'س',
      'beginning': 'سـ',
      'middle': 'ـسـ',
      'end': 'ـس',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ش',
      'beginning': 'شـ',
      'middle': 'ـشـ',
      'end': 'ـش',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ص',
      'beginning': 'صـ',
      'middle': 'ـصـ',
      'end': 'ـص',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ض',
      'beginning': 'ضـ',
      'middle': 'ـضـ',
      'end': 'ـض',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ط',
      'beginning': 'طـ',
      'middle': 'ـطـ',
      'end': 'ـط',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ظ',
      'beginning': 'ظـ',
      'middle': 'ـظـ',
      'end': 'ـظ',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ع',
      'beginning': 'عـ',
      'middle': 'ـعـ',
      'end': 'ـع',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'غ',
      'beginning': 'غـ',
      'middle': 'ـغـ',
      'end': 'ـغ',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ف',
      'beginning': 'فـ',
      'middle': 'ـفـ',
      'end': 'ـف',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ق',
      'beginning': 'قـ',
      'middle': 'ـقـ',
      'end': 'ـق',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ك',
      'beginning': 'كـ',
      'middle': 'ـكـ',
      'end': 'ـك',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ل',
      'beginning': 'لـ',
      'middle': 'ـلـ',
      'end': 'ـل',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'م',
      'beginning': 'مـ',
      'middle': 'ـمـ',
      'end': 'ـم',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ن',
      'beginning': 'نـ',
      'middle': 'ـنـ',
      'end': 'ـن',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ه',
      'beginning': 'هـ',
      'middle': 'ـهـ',
      'end': 'ـه',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'و',
      'beginning': 'وـ',
      'middle': 'ـوـ',
      'end': 'ـو',
      'words': ['باب', 'كتاب', 'حليب'],
    },
    {
      'letter': 'ى',
      'beginning': 'ىـ',
      'middle': 'ـىـ',
      'end': 'ـى',
      'words': ['باب', 'كتاب', 'حليب'],
    },
  ];

  Future<void> speak(String text) async {
    await flutterTts.stop(); // إيقاف أي نطق سابق
    await flutterTts.setLanguage("ar-EG"); // استخدام لهجة محددة
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: const Text('تعلم الحروف العربية')),
      body: ListView.builder(
        itemCount: letters.length,
        itemBuilder: (context, index) {
          final letter = letters[index];
          return Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  _buildHouse(letter),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHouse(Map<String, dynamic> letter) {
    return Column(
      children: [
        // الشمس
        const Align(
          alignment: Alignment.topLeft,
          child: Icon(Icons.wb_sunny, color: Colors.yellow, size: 60),
        ),

        // السقف + الحرف الرئيسي
        Stack(
          alignment: Alignment.center,
          children: [
            _buildTriangle(),
            GestureDetector(
              onTap: () => speak(letter['letter']),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Text(
                  letter['letter'],
                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),

        // جسم المنزل
        Container(
          width: 300,
          height: 220,
          decoration: BoxDecoration(
            color:   Color(0xFFF7BBBC),
            //borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              // النوافذ الثلاثة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildWindow(
                    letter['end'],
                    (letter['words']?.length ?? 0) > 2 ? letter['words'][2] : '',
                    'end',
                  ),
                  _buildWindow(
                    letter['middle'],
                    (letter['words']?.length ?? 0) > 1 ? letter['words'][1] : '',
                    'middle',
                  ),
                  _buildWindow(
                    letter['beginning'],
                    (letter['words']?.isNotEmpty ?? false) ? letter['words'][0] : '',
                    'beginning',
                  ),
                ],
              ),

              // الباب
              const SizedBox(height: 15),
              _buildDoor(),
            ],
          ),
        ),

        // الأشجار
        //const SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTree(),
              _buildTree(),
            ],
          ),

      ],
    );
  }

  Widget _buildTriangle() {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        width: 330,
        height: 120,
        color: Color(0xFF0CF2EE).withOpacity(.7),
      ),
    );
  }


// تعديل دالة _buildWindow:
  Widget _buildWindow(String text, String word, String form) {
  return GestureDetector(
    onTap: () {
      if (word.isNotEmpty) {
        speak(word); // إضافة استدعاء دالة النطق هنا
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WordDetailScreen(
              word: word,
              form: form,
              letter: text,
            ),
          ),
        );
      }
  },
  child: Container(
  margin: const EdgeInsets.all(8),
  width: 70,
  height: 70,
  decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 4)],
  ),
  child: Center(
  child: Text(
  text,
  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,  fontFeatures: [FontFeature('arab')],),
  ),
  ),
  ),
  );
  }

  Widget _buildDoor() {
    return Container(
      width: 65,
      height: 110,
      decoration: BoxDecoration(
        color: Color(0xFF0CF2EE).withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          width: 15,
          height: 15,
          decoration: const BoxDecoration(
            color: Color(0xFFF7BBBC),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildTree() {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(
          width: 10,
          height: 30,
          color: Colors.brown.shade600,
        ),
      ],
    );
  }
}

// كلاس لرسم السقف الثلاثي
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
