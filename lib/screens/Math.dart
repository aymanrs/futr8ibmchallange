import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/services/auth.dart';
import 'package:youtube_player/youtube_player.dart';

class Math extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math cources'),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              icon: Icon(Icons.person),
              onPressed: (){
                Navigator.pushNamed(context, 'profile');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              icon: Icon(Icons.videocam),
              onPressed: (){
                Navigator.pushNamed(context, 'videoCall');
              },
            ),
          ),

        ],
      ),
      body: ListView(
        children: [
          [
            "https://www.youtube.com/watch?v=4VcKulax62U",
            "الجزء 1 : المتتاليات العددية - حساب النهايات",
            "Aderdour Mustapha"
          ],
          [
            "https://www.youtube.com/watch?v=baGvgYVjuZg",
            "درس الإتصال 1 ـــ الإتصال في نقطة جزء 1,",
            "Aderdour Mustapha"
          ],
          [
            "https://www.youtube.com/watch?v=dNfK0llVmzo",
            "2 eme bac : limites et continuité : Calcul de limites simples partie 1 darija",
            "exo maroc"
          ],
          [
            "https://www.youtube.com/watch?v=2EME0Npz-Dc",
            "Mathématiques - Cours 1: Continuité d'une fonction",
            "FORSALINAJAH FORSA"
          ],
          [
            "https://www.youtube.com/watch?v=EIyGLNMlgpM",
            "maths bac fr étude de fonctions exercice",
            "Youssef Nejjari"
          ],
        ]
            .map(
              (x) => VideoCard(
                link: x[0],
                title: x[1],
                author: x[2],
              ),
            )
            .toList(),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String link;

  final String author;

  final String title;

  const VideoCard({Key key, this.link, this.title, this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => VideoScreen(
                    link: link,
                    title: title,
                    author: author,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
        ),
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                author,
                style: TextStyle(fontSize: 30, color: Colors.grey.shade300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoScreen extends StatelessWidget {
  final String link;
  final String title;
  final String author;

  const VideoScreen({Key key, this.link, this.title, this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Lesson"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Spacer(),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              author,
            ),
            Spacer(),
            YoutubePlayer(
              context: context,
              source: link.substring(link.indexOf('?v=') + 3),
              quality: YoutubeQuality.HD,
              autoPlay: false,
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            Center(
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Start a private live Lesson',
                      style: TextStyle(fontSize: 29.0, color: Colors.white)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'videoCall');
                }, //validateAndSubmit
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
