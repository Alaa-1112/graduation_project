import 'package:flutter/material.dart';
import 'package:kids/story/story_detail.dart';

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 320.0, top: 25),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop('');
              },
               // Colors.orange.shade800
              icon: Icon(Icons.arrow_back, color:Color(0xFF45FFD4), size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 15),
            child: Container(
              width: 360,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
   // [Colors.orange,Colors.deepOrange] 87DED9
                gradient: LinearGradient(colors: [Color(0xFF45FFD4),Color(0xFF4EBBB6)],
                  begin: Alignment.topLeft, // Start from the top left
                  end: Alignment.bottomRight, // End at the bottom right
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 58.0),
                      child: Column(
                        children: [
                          Text("Children's ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text("stories ",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    Image.asset("assets/images/mamy1.png"),
                  ],
                ),
              )
            ),
          ),
         Padding(
           padding: const EdgeInsets.only(right: 160.0,top: 20),
           child: Text("Popular stories",style: TextStyle(fontSize: 25,color: Color(0xFF45FFD4),fontWeight: FontWeight.bold),),
         ),

          SizedBox(height: 20),

          // Scrollable list of Cont widgets
           Expanded(

              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(child: Cont(img: "assets/images/cast.png", txt: "The green castle", soundUrl: "audio/أ.mp3", detailImage: "assets/images/str1.png",)),
                      SizedBox(height: 30),
                      InkWell(child: Cont(img: "assets/images/sea.jpeg", txt: "Sheep in field", soundUrl: '', detailImage: '',)),
                      SizedBox(height: 30),
                      Ink(child: Cont(img: "assets/images/back.jpeg", txt: "Rabbit in field", soundUrl: '', detailImage: '',)),
                      SizedBox(height: 30),
                      InkWell(child: Cont(img: "assets/images/back.jpeg", txt: "Rabbit in field", soundUrl: '', detailImage: '',)),
                      SizedBox(height: 30),
                      InkWell(child: Cont(img: "assets/images/ارنب.png", txt: "Rabbit in field", soundUrl: '', detailImage: '',)),
                      SizedBox(height: 30),
                      InkWell(child: Cont(img: "assets/images/ارنب.png", txt: "Rabbit in field", soundUrl: '', detailImage: '',)),
                      SizedBox(height: 30),
                      InkWell(child: Cont(img: "assets/images/ارنب.png", txt: "Rabbit in field", soundUrl: '', detailImage: '',)),
                      SizedBox(height: 30),
                      InkWell(child: Cont(img: "assets/images/ارنب.png", txt: "Rabbit in field", soundUrl: '', detailImage: '',)),
                    ],
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}

class Cont extends StatefulWidget {
  const Cont({super.key, required this.img, required this.txt, required this.soundUrl, required this.detailImage});
  final String img;
  final String txt;
  final String soundUrl;
  final String detailImage;

  @override
  State<Cont> createState() => _ContState();
}

class _ContState extends State<Cont> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        // Navigate to the StoryDetailPage with the data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryDetailPage(

              txt: widget.txt,
              soundUrl: widget.soundUrl,
              detailImage:widget.detailImage,

            ),
          ),
        );
      },
      child: Container(
        width: 360,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF45FFD4).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
               // E7F4F3
                backgroundColor: Colors.white,
                radius: 45,
                child: ClipOval(

                  child: Image.asset(widget.img,fit: BoxFit.cover,width: 100,height: 100,),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                widget.txt,
                style: TextStyle(
                  fontSize: 22,
                  color:  Color(0xFF45FFD4),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20),
      IconButton(
      icon: Icon(
      Icons.favorite,
      color: _isFavorited ? Color(0xFF45FFD4) : Colors.grey, // Change color based on the state
      size: 35,
      ),
      onPressed: () {
      setState(() {
      _isFavorited = !_isFavorited; // Toggle the state
      });})
          ],
        ),
      ),
    );
  }
}

