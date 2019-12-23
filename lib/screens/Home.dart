import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
          /*
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              icon: Icon(Icons.videocam),
              onPressed: (){
                Navigator.pushNamed(context, 'choose');
              },
            ),
          ),
          */
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Subject(context, 'math', 'https://i-love-png.com/images/math-formula-2-765436.png'),
            Subject(
              context,
              'chimie',
              "https://pngimage.net/wp-content/uploads/2018/06/physique-chimie-png-5.png",
            ),
            Subject(
              context,
              'physique',
              "http://site.ac-martinique.fr/clgpetitmanoir/wp-content/uploads/2013/05/arton39.gif",
            ),
            Subject(
              context,
              'info',
              "https://cdn.iconscout.com/icon/premium/png-256-thumb/computer-science-1574087-1335434.png",
            ),
          ],
        ),
      ),
    );
  }

  Expanded Subject(BuildContext context, String route, String link) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
          ),
          margin: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child://Text("ad"),
                   CachedNetworkImage(
                    imageUrl: link,
                    placeholder: (context, url) => new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),

                ),
              ),
              Spacer(),
              Center(
                child: Text(
                  route[0].toUpperCase() + route.substring(1),
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
