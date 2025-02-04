import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kids/class/letter_class.dart';

import '../english/letter.dart';
import 'letter_arab.dart';


class ArabicAlphabetsPage extends StatefulWidget {
  @override
  _ArabicAlphabetsPageState createState() => _ArabicAlphabetsPageState();
}

class _ArabicAlphabetsPageState extends State<ArabicAlphabetsPage>
    with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void playSound(String letter) async {
    String assetPath = 'audio/$letter.mp3';
    try {
      await _audioPlayer.play(AssetSource(assetPath));
    } catch (e) {
      print('Error playing sound: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<LetterWord> letters = [
      LetterWord(letter: 'أ', word: 'أرنب',sound: "assets/audio/أ.mp3",image: "assets/images/ارنب.png"),
      LetterWord(letter: 'ب', word: 'بطة',sound: "assets/audio/ب.mp3",image: "assets/images/بطة.png"),
      LetterWord(letter: 'ت', word: 'تفاحة',sound: "assets/audio/ب.mp3",image: "assets/images/تفاحة.png"),
      LetterWord(letter: 'ث', word: 'ثعلب',sound: "assets/audio/ب.mp3",image: "assets/images/ثعلب.png"),
      LetterWord(letter: 'ج', word: 'جمل',sound: "assets/audio/ب.mp3",image: "assets/images/جمل.png"),
      LetterWord(letter: 'ح', word: 'حصان',sound: "assets/audio/ب.mp3",image: "assets/images/حصان.png"),
      LetterWord(letter: 'خ', word: 'خروف',sound: "assets/audio/ب.mp3",image: "assets/images/خروف.png"),
      LetterWord(letter: 'د', word: 'دجاجة',sound: "assets/audio/ب.mp3",image: "assets/images/دجاجة.png"),
      LetterWord(letter: 'ذ', word: 'ذئب',sound: "assets/audio/ب.mp3",image: "assets/images/ذئب.png"),
      LetterWord(letter: 'ر', word: 'رمان',sound: "assets/audio/ب.mp3",image: "assets/images/رمان.png"),
      LetterWord(letter: 'ز', word: 'زرافة',sound: "assets/audio/ب.mp3",image: "assets/images/زرافة.png"),
      LetterWord(letter: 'س', word: 'سمكة',sound: "assets/audio/ب.mp3",image: "assets/images/سمكة.png"),
      LetterWord(letter: 'ش', word: 'شمس',sound: "assets/audio/ب.mp3",image: "assets/images/شمس.png"),
      LetterWord(letter: 'ص', word: 'صقر',sound: "assets/audio/ب.mp3",image: "assets/images/صقر.png"),
      LetterWord(letter: 'ض', word: 'ضفدع',sound: "assets/audio/ب.mp3",image: "assets/images/ضفدع.png"),
      LetterWord(letter: 'ط', word: 'طائر',sound: "assets/audio/ب.mp3",image: "assets/images/طائر.png"),
      LetterWord(letter: 'ظ', word: 'ظبي',sound: "assets/audio/ب.mp3",image: "assets/images/ظبى.png"),
      LetterWord(letter: 'ع', word: 'عصفور',sound: "assets/audio/ب.mp3",image: "assets/images/عصفور.png"),
      LetterWord(letter: 'غ', word: 'غزال',sound: "assets/audio/ب.mp3",image: "assets/images/غزال.png"),
      LetterWord(letter: 'ف', word: 'فيل',sound: "assets/audio/ب.mp3",image: "assets/images/فيل.png"),
      LetterWord(letter: 'ق', word: 'قلم',sound: "assets/audio/ب.mp3",image: "assets/images/قلم.png"),
      LetterWord(letter: 'ك', word: 'كلب',sound: "assets/audio/ب.mp3",image: "assets/images/كلب.png"),
      LetterWord(letter: 'ل', word: 'ليمون',sound: "assets/audio/ب.mp3",image: "assets/images/لمون.png"),
      LetterWord(letter: 'م', word: 'مسجد',sound: "assets/audio/ب.mp3",image: "assets/images/مسجد.png"),
      LetterWord(letter: 'ن', word: 'نهر',sound: "assets/audio/ب.mp3",image: "assets/images/نهر.png"),
      LetterWord(letter: 'ه', word: 'هلال',sound: "assets/audio/ب.mp3",image: "assets/images/هلال.png"),
      LetterWord(letter: 'و', word: 'وردة',sound: "assets/audio/ب.mp3",image: "assets/images/وردة.png"),
      LetterWord(letter: 'ي', word: 'يد',sound: "assets/audio/ب.mp3",image: "assets/images/يد.png"),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
            children: [
        Padding(
        padding: const EdgeInsets.only(right: 320.0, top: 30),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      Expanded(
      child:GridView.count(
      crossAxisCount: 2,
      children: letters
          .map(
            (letterWord) => GestureDetector(
          onTap: () {
            playSound(letterWord.letter.toLowerCase());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LetterArab (
                  letter: letterWord.letter,
                  word: letterWord.word,
                  image: letterWord.image,
                ),
              ),
            );
          },
          child:Card(
              elevation: 4, // Optional: Adds shadow to the card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Optional: Rounded corners
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0CF2EE).withOpacity(.7), // Start color
                      Color(0xFFEAF2DC), // End color
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10), // Match the card's border radius
                ),
                child: Center(
                  child: Text(
                    letterWord.letter,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ),
      )
          .toList(),
        ))]
      )));
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ArabicAlphabetsPage(),
    );
  }
}