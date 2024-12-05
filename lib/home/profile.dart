import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kids/home/profile_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Import the file that contains profileImageNotifier


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _profileImage;
  int? _score;

  @override
  void initState() {
    super.initState();
    _loadScore();
    _loadProfileImage();
  }

  Future<void> _loadScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _score = prefs.getInt('child_score') ?? 0; // Default value is zero
    });
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPath = prefs.getString('profileImage');
    if (savedPath != null) {
      setState(() {
        _profileImage = File(savedPath);
      });
    }
  }

  Future<void> _updateProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImage', pickedFile.path);

      // Update home image
      homeImageNotifier.value = File(pickedFile.path);
      await prefs.setString('homeImage', pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0, right: 330),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Colors.grey[800], size: 30),
            ),
          ),
          GestureDetector(
            onTap: _updateProfileImage,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey[200],
              backgroundImage: _profileImage != null
                  ? FileImage(_profileImage!)
                  : AssetImage('assets/images/default.png') as ImageProvider,
            ),
          ),
          Center(
            child: Text(
              'نتيجتك الحالية: $_score من 10',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}


