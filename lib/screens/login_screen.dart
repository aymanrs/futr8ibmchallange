import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'create_account_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoginForm= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
              ),
              labelText: 'e-mail or username',
            ),
            validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
            //onSaved: (value) => _email = value.trim(),
            controller: _emailController,
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
              ),
              labelText: 'password',
            ),
            validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
            //onSaved: (value) => _password = value.trim(),
            controller: _passwordController,
          ),

          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Forgot your password ?'),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                },
              ),
              FlatButton(
                child: Text('Don\'t have an account yet ?\nSign up for free!'),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CreateAnAccountScreen()));
                },
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
            child: new RaisedButton(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.blue,
              child: new Text(_isLoginForm ? 'Login' : 'Create account',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white)),
              onPressed: () async {
                var user = await Provider.of<AuthService>(context)
                    .signIn(_emailController.text, _passwordController.text);
                if (user != null) {
                  Navigator.pushReplacementNamed(context, 'profile');
                }
                else print("errrrrrrrrrrrrrrrrrrrr");
              },//validateAndSubmit
            ),
          ),
          Text(
            "or",
            style: TextStyle(fontSize: 70),
          ),
          FlatButton.icon(
            icon: Icon(FontAwesomeIcons.google, color: Colors.blue),
            color: Colors.white,
            onPressed: () async {
              var user = await Provider.of<AuthService>(context).googleSignIn();
              if (user != null) {
                print(user);
                Navigator.pushReplacementNamed(context, 'profile');
              }
            },
            label: Expanded(
              child: Text(
                'se connecter avec google',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 23),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
