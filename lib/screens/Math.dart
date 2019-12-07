import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class Math extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math cources'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          "https://www.youtube.com/watch?v=4VcKulax62U",
          "https://www.youtube.com/watch?v=baGvgYVjuZg",
          "https://www.youtube.com/watch?v=dNfK0llVmzo",
          "https://www.youtube.com/watch?v=2EME0Npz-Dc",
          "https://www.youtube.com/watch?v=EIyGLNMlgpM",
          "https://www.youtube.com/watch?v=vaRkqrCCWPY",
          "https://www.youtube.com/watch?v=Tx-6HenJrcg",
        ].map((x) => Video(link: x,)).toList(),
      ),
    );
  }
}
class Video extends StatelessWidget {
  final String link;

  const Video({Key key, this.link}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: YoutubePlayer(
        context: context,
        source:link.substring(link.indexOf('?v=')+3),
        quality: YoutubeQuality.HD,
        autoPlay: false,

      ),
    );

  }
}

