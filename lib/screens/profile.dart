import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/utilities/compare_maps.dart';
import 'package:flutter_ibmchallenge/utilities/gender_enum.dart';
import 'package:flutter_ibmchallenge/utilities/random_codes_generator.dart';
import 'package:flutter_ibmchallenge/utilities/role_enum.dart';
import 'package:flutter_ibmchallenge/utilities/user_informations.dart';


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
