import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../class/letter_class.dart';
import 'letter.dart';


class EnglishAlphabetsPage extends StatefulWidget {
  @override
  _EnglishAlphabetsPageState createState() => _EnglishAlphabetsPageState();
}

class _EnglishAlphabetsPageState extends State<EnglishAlphabetsPage>
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
      LetterWord(letter: 'Aa', word: 'Apple',sound: "assets/audio/أ.mp3",image: "assets/images/تفاحة.png"),
      LetterWord(letter: 'Bb', word: 'Ball',sound: "assets/audio/ب.mp3",image: "assets/images/ball.png"),
      LetterWord(letter: 'Cc', word: 'Cat',sound: "assets/audio/ب.mp3",image: "assets/images/cat.png"),
      LetterWord(letter: 'Dd', word: 'Dog',sound: "assets/audio/ب.mp3",image: "assets/images/كلب.png"),
      LetterWord(letter: 'Ee', word: 'Elephant',sound: "assets/audio/ب.mp3",image: "assets/images/فيل.png"),
      LetterWord(letter: 'Ff', word: 'Fish',sound: "assets/audio/ب.mp3",image: "assets/images/سمكة.png"),
      LetterWord(letter: 'Gg', word: 'Girl',sound: "assets/audio/ب.mp3",image: "assets/images/girl.png"),
      LetterWord(letter: 'Hh', word: 'Hand',sound: "assets/audio/ب.mp3",image: "assets/images/يد.png"),
      LetterWord(letter: 'Ii', word: 'Icecream',sound: "assets/audio/ب.mp3",image: "assets/images/icecream.png"),
      LetterWord(letter: 'Jj', word: 'Jam',sound: "assets/audio/ب.mp3",image: "assets/images/jam.png"),
      LetterWord(letter: 'Kk', word: 'Kite',sound: "assets/audio/ب.mp3",image: "assets/images/kite.png"),
      LetterWord(letter: 'Ll', word: 'Lemon',sound: "assets/audio/ب.mp3",image: "assets/images/لمون.png"),
      LetterWord(letter: 'Mm', word: 'Monkey',sound: "assets/audio/ب.mp3",image: "assets/images/monkey.png"),
      LetterWord(letter: 'Nn', word: 'Nut',sound: "assets/audio/ب.mp3",image: "assets/images/nut.png"),
      LetterWord(letter: 'Oo', word: 'Orange',sound: "assets/audio/ب.mp3",image: "assets/images/orange.png"),
      LetterWord(letter: 'Pp', word: 'Parrot',sound: "assets/audio/ب.mp3",image: "assets/images/parrot.png"),
      LetterWord(letter: 'Qq', word: 'Queen',sound: "assets/audio/ب.mp3",image: "assets/images/queen.png"),
      LetterWord(letter: 'Rr', word: 'Rabbit',sound: "assets/audio/ب.mp3",image: "assets/images/ارنب.png"),
      LetterWord(letter: 'Ss', word: 'Sun',sound: "assets/audio/ب.mp3",image: "assets/images/شمس.png"),
      LetterWord(letter: 'Tt', word: 'Tree',sound: "assets/audio/ب.mp3",image: "assets/images/tree.png"),
      LetterWord(letter: 'Uu', word: 'Umbrella',sound: "assets/audio/ب.mp3",image: "assets/images/umbrella.png"),
      LetterWord(letter: 'Vv', word: 'Vase',sound: "assets/audio/ب.mp3",image: "assets/images/vase.png"),
      LetterWord(letter: 'Ww', word: 'Whale',sound: "assets/audio/ب.mp3",image: "assets/images/whale.png"),
      LetterWord(letter: 'Xx', word: 'Xylophone',sound: "assets/audio/ب.mp3",image: "assets/images/xylophone.png"),
      LetterWord(letter: 'Yy', word: 'Yacht',sound: "assets/audio/ب.mp3",image: "assets/images/yacht.png"),
      LetterWord(letter: 'Zz', word: 'Zebra',sound: "assets/audio/ب.mp3",image: "assets/images/zebra.png"),

    ];

    return GridView.count(
      crossAxisCount: 2,
      children: letters
          .map(
            (letterWord) => GestureDetector(
          onTap: () {
            playSound(letterWord.letter.toLowerCase());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LetterPage(
                  letter: letterWord.letter,
                  word: letterWord.word,
                  image: letterWord.image,
                ),
              ),
            );
          },
          child: Card(
              child: Center(
                child: Text(letterWord.letter,style:TextStyle(fontSize:50,fontWeight: FontWeight.bold,color:Colors.orange  ) ,),

              )

          ),
        ),
      )
          .toList(),
    );
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
      home: EnglishAlphabetsPage(),
    );
  }}




