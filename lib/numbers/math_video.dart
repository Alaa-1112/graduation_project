import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MathVideo extends StatefulWidget {
  const MathVideo({super.key});

  @override
  State<MathVideo> createState() => _MathVideoState();
}

class _MathVideoState extends State<MathVideo> {
  List<YoutubePlayerController> _controllers = [];

  final List<Map<String, String>> videoData = [
    {
      'url': 'https://youtu.be/Zx7QcpyhKHc',
      'description': 'تعلم الأرقام من 1 إلى 10 بطريقة سهلة و مرحة للأطفال - الأرقام - الأعداد',
    },
    {
      'url': 'https://youtu.be/kTHaNZSFu64',
      'description': 'Arabic Numbers 1-20 الأرقام ١-٢٠',
    },
    {
      'url': 'https://youtu.be/jAc_AH9SwFY',
      'description': 'لأرقام بالعربي للأطفال الصغار 👶 من واحد لعشرة 👶 تعليم الاطفال مع البنت الصغيرة _ numbers for kids',
    },
    {
      'url': 'https://youtu.be/JQCSlaFtVr8',
      'description': 'كتابة الأرقام العربية - تعليم كتابة الأرقام العربية من 1 إلى 10 وطريقة نطقها بسهولة',
    },
    {
      'url': 'https://youtu.be/AgImfNdIJVQ',
      'description': 'لأرقام - تأسيس للأطفال - باللهجة المصرية - الأعداد من 1 إلى 10 - Learn Numbers in Arabic for Kids',
    },
    {
      'url': 'https://youtu.be/fIMOkV63X5I',
      'description': 'Learn The Numbers In Arabic تعلم الارقام بالعربية - كارتون للاطفال',
    },
    {
      'url': 'https://youtu.be/71lyGg8f5HM',
      'description': 'غنية الأرقام ( أنا الواحد يا حلوين) | قناة مرح كي جي - Marah KG',
    },
    {
      'url': 'https://youtu.be/oez4IwKKiqQ',
      'description': 'أغنية الأرقام | أنشودة الأرقام والأعداد العربية نصف ساعة من أجمل الأغاني التعليمية للأطفال',
    },
    {
      'url': 'https://youtu.be/oMgnx6yhs5k',
      'description': 'قناة طم طم | أغنية الأرقام للأطفال عربي - انجليزي',
    },
    // Add more videos as needed
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the YouTube player controllers
    for (var video in videoData) {
      String? id = YoutubePlayer.convertUrlToId(video['url']!);
      if (id != null) {
        _controllers.add(YoutubePlayerController(
          initialVideoId: id,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        ));
      }
    }
  }

  @override
  void dispose() {
    // Dispose all YouTube controllers
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 40),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop('');
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 40),
                child: Text(
                  "شاهد الفيديوهات لتفهم اكثر",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          //SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _controllers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoDetailPage(
                          controller: _controllers[index],
                          txt: videoData[index]['description']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          child: Image.network(
                            'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(videoData[index]['url']!)}/0.jpg', // صورة الفيديو المصغرة
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            videoData[index]['description']!,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VideoDetailPage extends StatelessWidget {
  final YoutubePlayerController controller;
  final String txt;

  const VideoDetailPage({super.key, required this.controller, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(txt),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}



