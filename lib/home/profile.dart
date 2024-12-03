import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kids/home/profile_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
 // Import الملف الذي يحتوي على profileImageNotifier

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  // تحميل صورة البروفايل المخزنة
  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPath = prefs.getString('profileImage');
    if (savedPath != null) {
      setState(() {
        _profileImage = File(savedPath);
      });
    }
  }

  // تغيير صورة البروفايل
  Future<void> _updateProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });

      // حفظ صورة البروفايل فقط
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImage', pickedFile.path);

      // تحديث صورة الهوم لتتغير مثلها
      homeImageNotifier.value = File(pickedFile.path);
      await prefs.setString('homeImage', pickedFile.path); // تحديث صورة الهوم
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
          ]
          ),


    );
  }
}

