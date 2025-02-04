import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kids/theme/theme_provider.dart'; // استبدل بمسار ملف theme_provider.dart

class Setting extends StatelessWidget {

  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Colors.grey[800], size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark mode",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}