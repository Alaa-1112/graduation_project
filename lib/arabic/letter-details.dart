import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:characters/characters.dart';

class WordDetailScreen extends StatelessWidget {
  final String word;
  final String form;
  final String letter;

  const WordDetailScreen({
    super.key,
    required this.word,
    required this.form,
    required this.letter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الكلمة')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'الكلمة: $word',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            _buildHighlightedWord(),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightedWord() {
    int highlightIndex = _getHighlightIndex();

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: word.substring(0, highlightIndex), // الجزء الأول من الكلمة
            style: const TextStyle(fontSize: 40, color: Colors.black),
          ),
          TextSpan(
            text: word[highlightIndex], // الحرف المطلوب تمييزه
            style: const TextStyle(fontSize: 40, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: word.substring(highlightIndex + 1), // الجزء الأخير من الكلمة
            style: const TextStyle(fontSize: 40, color: Colors.black),
          ),
        ],
      ),
      textDirection: TextDirection.rtl, // لضبط اتجاه النص
    );
  }

// دالة تحدد موقع الحرف المطلوب تمييزه
  int _getHighlightIndex() {
    switch (form) {
      case 'beginning':
        return 0;
      case 'middle':
        return (word.length - 1) ~/ 2;
      case 'end':
        return word.length - 1;
      default:
        return -1;
    }
  }



  bool _shouldHighlight(String char, int index) {
    switch (form) {
      case 'beginning':
        return index == 0;
      case 'middle':
        return index == (word.length - 1) ~/ 2;
      case 'end':
        return index == word.length - 1;
      default:
        return false;
    }
  }
}