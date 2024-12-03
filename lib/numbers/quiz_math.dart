import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MathQuizApp());

class MathQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MathQuiz(),
    );
  }
}

class MathQuiz extends StatefulWidget {
  const MathQuiz({super.key});

  @override
  State<MathQuiz> createState() => _MathQuizState();
}

class _MathQuizState extends State<MathQuiz> {
  final PageController _pageController = PageController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentIndex = 0;
  int _score = 0;

  final List<Question> _questions = [
    Question(
      soundQuestion: 'audio/بيضة.mp3',
      image: 'assets/images/chicken.jpg',
      correctAnswer: 6,
      options: ['٧', '٦', '٥'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
    Question(
      soundQuestion: 'audio/بط.mp3',
      image: 'assets/images/بط.jpg',
      correctAnswer: 7,
      options: ['٥', '١٠', '٧'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
    Question(
      soundQuestion: 'audio/ارنب.mp3',
      image: 'assets/images/ارانب.jpg',
      correctAnswer: 2,
      options: ['٧', '٤', '٢'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
    Question(
      soundQuestion: 'audio/طائر.mp3',
      image: 'assets/images/طيور.jpg',
      correctAnswer: 15,
      options: ['١٢', '١٥', '١٧'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
    Question(
      soundQuestion: 'audio/اطفال.mp3',
      image: 'assets/images/اطفال.jpg',
      correctAnswer: 5,
      options: ['٥', '٤', '٨'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
    Question(
      soundQuestion: 'audio/خروف.mp3',
      image: 'assets/images/خروف.jpg',
      correctAnswer: 6,
      options: ['٤', '٩', '٦'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
    Question(
      soundQuestion: 'audio/تفاح.mp3',
      image: 'assets/images/تفاح.jpg',
      correctAnswer: 7,
      options: ['١٠', '٩', '٧'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
    Question(
      soundQuestion: 'audio/شجر.mp3',
      image: 'assets/images/شجر.jpg',
      correctAnswer: 4,
      options: ['٤', '٨', '٦'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
    Question(
      soundQuestion: 'audio/حيوانات.mp3',
      image: 'assets/images/حيوانات.jpg',
      correctAnswer: 8,
      options: ['١٠', '٨', '٧'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
    Question(
      soundQuestion: 'audio/مرح.mp3',
      image: 'assets/images/لعب.jpg',
      correctAnswer: 11,
      options: ['١١', '٨', '٤'],
      optionColors: [Colors.purpleAccent, Colors.blue, Colors.pinkAccent],
      soundCorrect: 'audio/احسنت.mp3',
      soundIncorrect: 'audio/خطا.mp3',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _playSound(_questions[_currentIndex].soundQuestion);
  }

  void _checkAnswer(String answer, Question question) async {
    int numericAnswer = convertArabicToEnglishNumbers(answer);
    bool isCorrect = numericAnswer == question.correctAnswer;

    if (isCorrect) {
      _score++;
      await _playSound(question.soundCorrect);
    } else {
      await _playSound(question.soundIncorrect);
    }

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      _playSound(_questions[_currentIndex].soundQuestion);
    } else {
      _showResults();
    }
  }

  Future<void> _playSound(String soundPath) async {
    try {
      await _audioPlayer.play(AssetSource(soundPath));
      await _audioPlayer.onPlayerComplete.first; // انتظار انتهاء الصوت
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  int convertArabicToEnglishNumbers(String input) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const englishDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    for (int i = 0; i < arabicDigits.length; i++) {
      input = input.replaceAll(arabicDigits[i], englishDigits[i]);
    }

    return int.tryParse(input) ?? -1;
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('انتهى الاختبار!'),
        content: Text('لقد حصلت على $_score من ${_questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('موافق'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الصورة التي تملأ الشاشة
          Positioned.fill(
            child: Image.asset(
              _questions[_currentIndex].image,
              fit: BoxFit.cover, // تأكد من أن الصورة تغطي كامل الشاشة
            ),
          ),
          // شريط التقدم في أعلى الصفحة
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.blue.shade100,
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: (_currentIndex + 1) / _questions.length, // تحديث شريط التقدم بناءً على الفهرس الحالي
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.yellow.shade400,
                  ),
                ),
              ),
            ),
          ),
          // المحتوى الرئيسي (الأسئلة والإجابات)
          Padding(
            padding: const EdgeInsets.only(top: 50), // ترك مساحة لشريط التقدم
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _questions.length,
                    itemBuilder: (context, index) {
                      final question = _questions[index];
                      return _buildQuestionPage(question);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildQuestionPage(Question question) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(question.image),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 670.0, left: 20),
            child: Container(
              width: 350,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: Colors.lightGreenAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  question.options.length,
                      (index) => _buildAnswerButton(
                    question.options[index],
                    question.optionColors[index],
                    question,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(String answer, Color color, Question question) {
    return GestureDetector(
      onTap: () => _checkAnswer(answer, question),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            answer,
            style: TextStyle(
              color: color,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Question {
  final String soundQuestion;
  final String image;
  final int correctAnswer;
  final List<String> options;
  final List<Color> optionColors;
  final String soundCorrect;
  final String soundIncorrect;

  Question({
    required this.soundQuestion,
    required this.image,
    required this.correctAnswer,
    required this.options,
    required this.optionColors,
    required this.soundCorrect,
    required this.soundIncorrect,
  });
}

