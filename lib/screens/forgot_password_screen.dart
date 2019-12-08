import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(//
                  Icons.email,
                ),
                hintText: 'Type your e-mail adress here',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              child: Text(
                'Send me a new password',
              ),
              onPressed: () {
                //TODO: send an e-mail to the user with his new password
              },
            ),
          )
        ],
      ),
    );
  }
}