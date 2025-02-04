import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سور القرآن',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Amiri',
      ),
      home: QuranSurahsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuranSurahsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _surahPositions = [
    {'name': 'الفاتحة', 'top': 160.0, 'left': 300.0},
    {'name': 'الناس', 'top': 180.0, 'left': 236.0},
    {'name': 'الفلق', 'top': 180.0, 'left': 170.0},
    {'name': 'الإخلاص', 'top': 180.0, 'left': 106.0},
    {'name': 'المسد', 'top': 170.0, 'left': 45.0},
    {'name': 'النصر', 'top': 160.0, 'left': -10.0},
    {'name': 'الكافرون', 'top': 235.0, 'left': 310.0},
    {'name': 'الكوثر', 'top': 260.0, 'left': 250.0},
    {'name': 'الماعون', 'top': 250.0, 'left':195.0},
    {'name': 'قريش', 'top': 250.0, 'left': 140.0},
    {'name': 'الفيل', 'top': 240.0, 'left': 80.0},
    {'name': 'الهمزة', 'top': 240.0, 'left': 25.0},
    {'name': 'العصر', 'top': 233.0, 'left': -25.0},
    {'name': 'التكاثر', 'top': 322.0, 'left': 308.0},
    {'name': 'القارعة', 'top': 335.0, 'left': 253.0},
    {'name': 'العاديات', 'top': 325.0, 'left': 197.0},
    {'name': 'الزلزلة', 'top': 330.0, 'left': 140.0},
    {'name': 'البينة', 'top': 325.0, 'left': 87.0},
    {'name': 'االقدر', 'top': 320.0, 'left': 29.0},
    {'name': 'العلق', 'top': 315.0, 'left': -23.0},
    {'name': 'التين', 'top': 405.0, 'left': 310.0},
    {'name': 'الشرح', 'top': 419.0, 'left': 253.0},
    {'name': 'الضحى', 'top': 420.0, 'left': 195.0},
    {'name': 'الليل', 'top': 410.0, 'left': 140.0},
    {'name': 'الشمس', 'top': 410.0, 'left': 80.0},
    {'name': 'البلد', 'top':400.0, 'left': 25.0},
    {'name': 'الفجر', 'top': 410.0, 'left': -25.0},
    {'name': 'الغاشية', 'top': 490.0, 'left':310.0},
    {'name': 'الاعلى', 'top': 500.0, 'left': 255.0},
    {'name': 'الطارق', 'top': 510.0, 'left': 200.0},
    {'name': 'البروج', 'top': 490.0, 'left': 145.0},
    {'name': 'الانشقاق', 'top': 490.0, 'left': 85.0},
    {'name': 'المطففين', 'top': 480.0, 'left': 20.0},
    {'name': 'الانفطار', 'top': 560.0, 'left': 290.0},
    {'name': 'التكوير', 'top': 580.0, 'left': 230.0},
    {'name': 'عبس', 'top': 590.0, 'left': 170.0},
    {'name': 'النازعات', 'top': 580.0, 'left': 110.0},
    {'name': 'النبا', 'top': 590.0, 'left': 50.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          Positioned(
            //left: 10,
            top: 20,
            child: Container(
              height: 140,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/sun.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Center(
                  child: Text(
                    'احفظ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            )),
          Positioned(
            left: 20,
            child: Container(
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cloud.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: Center(
                child: Text(
                  'جزء عم',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
         Star(top: 320, right: 36),
          Star(top: 490, right: 340),
          Star(top: 590, right: 340),
          Star(top: 590, right: 300),
          Positioned(
                bottom: -60,
               left: -50,
                child: Transform.rotate(angle: 120, child: Image.asset("assets/images/قوس.png")),height: 220,width: 220,),
          Positioned(
            bottom: -60,
            right: -50,
            child: Transform.rotate(angle: -120, child: Image.asset("assets/images/قوس.png")),height: 220,width: 220,),
          ..._surahPositions.map((surah) {
            final String name = surah['name'];
            final int textLength = name.length;

            // Determine drop size based on text length
            double width = 100;
            double height = 110;
            if (textLength <= 7) {
              width = 100;
              height = 90;
            } else if (textLength >= 10) {
              width = 120;
              height = 130;
            }

            return Positioned(
              top: surah['top'],
              left: surah['left'],
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SurahVersesScreen(surahName: name),
                  ),
                ),
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/water-drop.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15, // Base font size
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class Star extends StatelessWidget{
  final double top;
  final double right;

  const Star({super.key, required this.top, required this.right});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child:  Image.asset("assets/images/star.png"),height: 50,width: 50,);
  }


}

class SurahVersesScreen extends StatelessWidget {
  final String surahName;

  const SurahVersesScreen({required this.surahName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surahName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Text(
          _getVersesForSurah(surahName),
          style: TextStyle(
            fontSize: 25,
            color: Colors.blue[900],
            height: 1.8,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  String _getVersesForSurah(String surah) {
    return '''
بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ
إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ
فَصَلِّ لِرَبِّكَ وَانْحَرْ
إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ
''';
  }
}
