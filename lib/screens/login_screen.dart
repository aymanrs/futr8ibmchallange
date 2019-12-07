import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoginForm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign in',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: Container(
                width: 300.0,
                child: Image(
                  image: AssetImage('res/images/logo.png'),
                ),
              ),
            ),
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
              obscureText:true,
              validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
              //onSaved: (value) => _password = value.trim(),
              controller: _passwordController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 0.0),
                  child: Text('Forgot your password ?'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      'forgot password',
                    );
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 0.0),
                  child: Text(
                    'Don\'t have an account ?\nSign up for free!',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      'profile',
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
              child: new RaisedButton(
                color:  Theme.of(context).primaryColor,
                elevation: 5.0,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                child: new Text(_isLoginForm ? 'Login' : 'Create account',
                    style: new TextStyle(fontSize: 29.0, color: Colors.white)),
                onPressed: () async {
                  var user = await Provider.of<AuthService>(context)
                      .signIn(_emailController.text, _passwordController.text);
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, 'home');
                  } else
                    print("errrrrrrrrrrrrrrrrrrrr");
                }, //validateAndSubmit
              ),
            ),
            FlatButton.icon(
              icon: Icon(FontAwesomeIcons.google, color: Theme.of(context).primaryColor),
              onPressed: () async {
                var user = await Provider.of<AuthService>(context).googleSignIn();
                if (user != null) {
                  print(user);
                  Navigator.pushReplacementNamed(context, 'home');
                }
              },
              label: Text(
                'Login with Google',
                textAlign: TextAlign.center,
                style: TextStyle(color:  Theme.of(context).primaryColor, fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
