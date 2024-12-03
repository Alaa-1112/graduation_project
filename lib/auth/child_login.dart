import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home.dart';
import '../home/profile_image.dart';

ValueNotifier<File?> homeImageNotifier = ValueNotifier<File?>(null);

class ChildLoginScreen extends StatefulWidget {
  @override
  _ChildLoginScreenState createState() => _ChildLoginScreenState();
}

class _ChildLoginScreenState extends State<ChildLoginScreen> {
  File? _selectedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadImages(); // تحميل صورة الهوم والبروفايل المخزنة
  }

  // اختيار صورة
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });

      final prefs = await SharedPreferences.getInstance();
      final isFirstRegistration = prefs.getBool('isFirstRegistration') ?? true;

      if (isFirstRegistration) {
        // حفظ صورة الهوم والبروفايل عند التسجيل الأول فقط
        homeImageNotifier.value = File(pickedFile.path); // حفظ صورة الهوم
        await prefs.setString('homeImage', pickedFile.path); // حفظ صورة الهوم
        await prefs.setString('profileImage', pickedFile.path); // حفظ صورة البروفايل
        await prefs.setBool('isFirstRegistration', false); // تحديث حالة التسجيل الأول
      } else {
        // عند تغيير صورة البروفايل، نقوم بتحديث صورة الهوم لتتغير مثلها
        homeImageNotifier.value = File(pickedFile.path); // تحديث صورة الهوم
        await prefs.setString('profileImage', pickedFile.path);
        await prefs.setString('homeImage', pickedFile.path); // تحديث صورة الهوم
      }
    }
  }

  // تحميل الصور المحفوظة
  Future<void> _loadImages() async {
    final prefs = await SharedPreferences.getInstance();
    final savedHomePath = prefs.getString('homeImage');
    final savedProfilePath = prefs.getString('profileImage');

    if (savedHomePath != null) {
      homeImageNotifier.value = File(savedHomePath); // تحميل صورة الهوم
    }

    if (savedProfilePath != null) {
      setState(() {
        _selectedImage = File(savedProfilePath); // تحميل صورة البروفايل
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange[300]!, Colors.yellow[100]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/children.png'),
                  Text(
                    "تسجيل الدخول للطفل",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : AssetImage('assets/images/default.png')
                      as ImageProvider,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'اضغط لتحديد صورة الطفل',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  _buildTextField('اسم الطفل/ة', _nameController),
                  SizedBox(height: 20),
                  _buildTextField('البريد الإلكتروني', _mailController),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text('تسجيل الدخول'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}