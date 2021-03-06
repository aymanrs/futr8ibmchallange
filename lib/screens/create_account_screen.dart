import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/services/auth.dart';
import 'package:flutter_ibmchallenge/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ibmchallenge/utilities/gender_enum.dart';
import 'package:flutter_ibmchallenge/utilities/role_enum.dart';

class CreateAnAccountScreen extends StatefulWidget {
  @override
  _CreateAnAccountScreenState createState() => _CreateAnAccountScreenState();
}

class _CreateAnAccountScreenState extends State<CreateAnAccountScreen> {
  Map<String, dynamic> userInformations = {'age': 0, 'gender': Gender.Male, 'role': Role.Student};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Container(
            height: 550,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                Center(
                  child: DropdownButton<Role>(
                    value: userInformations['role'],
                    items: [
                      DropdownMenuItem(
                        child: Text('Student'),
                        value: Role.Student,
                      ),
                      DropdownMenuItem(
                        child: Text('Teacher'),
                        value: Role.Teacher,
                      ),
                    ],
                    onChanged: (value){
                      setState(() {
                        userInformations['role'] = value;
                      });
                    },
                  ),
                ),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(
                      Icons.email,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      userInformations['email'] = value;
                    });
                  },
                  validator: (value) =>
                  value.isEmpty ? 'Email can\'t be empty' : null,
                  //onSaved: (value) => _email = value.trim(),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'First Name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            userInformations['first name'] = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            userInformations['last name'] = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    DropdownButton<Gender>(
                      value: userInformations['gender'],
                      items: [
                        DropdownMenuItem(
                          value: Gender.Male,
                          child: Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: Gender.Female,
                          child: Text('Female'),
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          userInformations['gender'] = value;
                        });
                      },
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${userInformations['age']} years',
                          ),
                          Slider(
                            divisions: 100,
                            max: 100,
                            min: 0,
                            value: userInformations['age'].toDouble(),
                            onChanged: (value) {
                              setState(() {
                                userInformations['age'] = value.toInt();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Icon(
                      Icons.lock,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      userInformations['password'] = value;
                    });
                  },
                  validator: (value) =>
                  value.isEmpty ? 'Password can\'t be empty' : null,
                  //onSaved: (value) => _password = value.trim(),
                ),

                SizedBox(
                  height: 50.0,
                  child: new RaisedButton(
                    color:  Theme.of(context).primaryColor,
                    elevation: 5.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    child: new Text('Sign up !',
                        style: new TextStyle(fontSize: 29.0, color: Colors.white)),
                    onPressed:() async {
                      var user = await Provider.of<AuthService>(context).signUp(
                          userInformations['e-mail'], userInformations['password']);
                      if (user != null) {
                        print(user);
                        UserFromFuture usr =
                        await Provider.of<AuthService>(context).getUser;
                        print("anas : " + usr.claims['name'].toString());
                        Navigator.pushReplacementNamed(context, 'profile');
                      } else
                        print("errrrrrrrrrrrrrrrrrrrr");
                    }, //validateAndSubmit
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 0.0),
                  child: Text(
                    'already have an account! Login from here',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      'login screen',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
