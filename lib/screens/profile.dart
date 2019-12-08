import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/utilities/compare_maps.dart';
import 'package:flutter_ibmchallenge/utilities/gender_enum.dart';
import 'package:flutter_ibmchallenge/utilities/random_codes_generator.dart';
import 'package:flutter_ibmchallenge/utilities/role_enum.dart';
import 'package:flutter_ibmchallenge/utilities/user_informations.dart';


import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/services/auth.dart';
import 'package:provider/provider.dart';
import 'Loading.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoded;
  User user;

  @override
  void initState() {
    isLoded = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Profile'),
      ),
      body: isLoded
          ? Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Provider.of<User>(context).claims['name'].toString(),
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Email : ' + Provider.of<User>(context).claims['email'].toString(),
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Roles : " + Provider.of<User>(context).roles.toString(),
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            Divider(),
            Center(child: logoutButton(context)),
          ],
        ),
      )
          : MySplashScreen(),
    );
  }

  FlatButton logoutButton(BuildContext context) {
    return FlatButton(
      child: Text(
        'logout',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Theme.of(context).primaryColor,
      onPressed: () async {
        setState(() {
          isLoded = false;
        });
        await Provider.of<AuthService>(context).signOut();
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        print( Provider.of<User>(context).claims['name'].toString());
      },
    );
  }
}



/*
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> userInformations = getUserInformations();
  Map<String, bool> fieldsReadOnlyValues = {
    'first name': true,
    'last name': true,
    'username': true,
    'e-mail': true,
    'password': true,
  };
  bool showButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(userInformations['picture']),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
