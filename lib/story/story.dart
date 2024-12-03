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
            padding: const EdgeInsets.only(top: 48.0,left: 15),
            child: Container(
              width: 360,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(colors: [Colors.orange,Colors.deepOrange],
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

                    Image.asset("assets/images/mamy.png"),
                  ],
                ),
              )
            ),
          ),
         Padding(
           padding: const EdgeInsets.only(right: 160.0,top: 20),
           child: Text("Popular stories",style: TextStyle(fontSize: 25,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
         ),
         /* Stack(
            children: [
              Container(
                width: 450,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                  ),
                  child: Image.asset(
                    "assets/images/str.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 15,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 30),
            child: Text(
              "Enjoy with the most beautiful stories",
              style: TextStyle(
                fontSize: 21,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),*/
          SizedBox(height: 20),

          // Scrollable list of Cont widgets
           Expanded(

              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(child: Cont(img: "assets/images/cast.png", txt: "The green castle", soundUrl: "audio/أ.mp3", detailImage: "assets/images/castle.png",)),
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
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.deepOrange.withOpacity(0.2),
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
                backgroundColor: Colors.orange[100],
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
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20),
      IconButton(
      icon: Icon(
      Icons.favorite,
      color: _isFavorited ? Colors.deepOrange : Colors.white, // Change color based on the state
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

