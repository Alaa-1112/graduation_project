import 'package:flutter/material.dart';
import 'package:kids/home/home.dart';
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body:Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 28.0),
                 child: IconButton(
                   onPressed: () {
                     Navigator.of(context).pop('');
                   },
                   icon: Icon(Icons.arrow_back, color: Colors.grey[800], size: 30),
                 ),
               ),
             ],
           )
    );
  }
}
