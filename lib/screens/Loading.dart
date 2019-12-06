import 'package:flutter/material.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key key}) : super(key: key);
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween(begin: 0.0, end: 2 * 3.14).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInCubic,
    ));
    animationController.repeat();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, w) {
        return Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Center(
              child: Transform.rotate(
            angle: animation.value,
            child: Icon(Icons.check_circle),
          )),
        );
      },
    );
  }
}
