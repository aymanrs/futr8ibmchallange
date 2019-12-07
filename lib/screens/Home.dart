import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[


          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'math');
              },
              child: Container(
                margin: EdgeInsets.all(12),
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl:
                          "https://i-love-png.com/images/math-formula-2-765436.png",
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        "Math",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'chimie');
              },
              child: Container(
                margin: EdgeInsets.all(12),
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl:
                          "https://pngimage.net/wp-content/uploads/2018/06/physique-chimie-png-5.png",
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        "Chimie",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'physique');
              },
              child: Container(
                margin: EdgeInsets.all(12),
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl:
                          "http://site.ac-martinique.fr/clgpetitmanoir/wp-content/uploads/2013/05/arton39.gif",
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        "Physique",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'info');
              },
              child: Container(
                margin: EdgeInsets.all(12),
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl:
                          "https://cdn.iconscout.com/icon/premium/png-256-thumb/computer-science-1574087-1335434.png",
                          placeholder: (context, url) => new CircularProgressIndicator(),
                          errorWidget: (context, url, error) => new Icon(Icons.error),
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        "Info",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Spacer(),
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
