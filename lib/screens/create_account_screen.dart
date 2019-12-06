import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/services/auth.dart';
import 'package:provider/provider.dart';

class CreateAnAccountScreen extends StatefulWidget {
  @override
  _CreateAnAccountScreenState createState() => _CreateAnAccountScreenState();
}

class _CreateAnAccountScreenState extends State<CreateAnAccountScreen> {
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                  //onSaved: (value) => _email = value.trim(),
                  controller: _emailController,
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                  //onSaved: (value) => _password = value.trim(),
                  controller: _passwordController,
                ),
              ),
            ],
          ),
          FlatButton(
            child: Text(
              'Sign up !',
            ),
            onPressed: () async {
              var user = await Provider.of<AuthService>(context)
                  .signUp(_emailController.text, _passwordController.text);
              if (user != null) {
                print(user);
                UserFromFuture usr = await Provider.of<AuthService>(context).getUser;
                print("anas : " + usr.claims['name'].toString());
                Navigator.pushReplacementNamed(context, 'profile');
              }
              else print("errrrrrrrrrrrrrrrrrrrr");
            },
          )
        ],
      ),
    );
  }
}
