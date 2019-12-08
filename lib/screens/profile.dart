import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/utilities/gender_enum.dart';
import 'package:flutter_ibmchallenge/utilities/user_informations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ibmchallenge/utilities/role_enum.dart';
import 'package:flutter_ibmchallenge/utilities/subjects.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> userInformations = getUserInformations();

  List<DropdownMenuItem<String>> getSubjects(){
    List<DropdownMenuItem<String>> res = [];
    for(String subject in branches.keys.toList()){
      res.add(
        DropdownMenuItem<String>(
          value: subject,
          child: Text(subject),
        ),
      );
    }
    return res;
  }

  List<DropdownMenuItem<String>> getBranches(String subject){
    List<DropdownMenuItem<String>> res = [];
    for(String branch in branches[subject]){
      res.add(
        DropdownMenuItem<String>(
          value: branch,
          child: Text(branch),
        ),
      );
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'http://www.weareteachers.com/wp-content/uploads/WaterfordResearch_Art_MAIN-IMAGE_ML.png'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: SizedBox(
                  width: 200.0,
                  child: FieldModel(
                    isArea: false,
                    label: 'username',
                    text: userInformations['username'],
                    icon: Icons.person,
                    onChanged: (value) {
                      setState(() {
                        userInformations['username'] = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: FieldModel(
                isArea: false,
                label: 'e-mail',
                icon: Icons.email,
                text: userInformations['email'],
                onChanged: (value) {
                  setState(() {
                    userInformations['email'] = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FieldModel(
                      isArea: false,
                      label: 'first name',
                      text: userInformations['first name'],
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
                    child: FieldModel(
                      isArea: false,
                      label: 'last name',
                      text: userInformations['last name'],
                      onChanged: (value) {
                        setState(() {
                          userInformations['last name'] = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  DropdownButton<Role>(
                    value: userInformations['role'],
                    items: [
                      DropdownMenuItem(
                        value: Role.Student,
                        child: Text('Student'),
                      ),
                      DropdownMenuItem(
                        value: Role.Teacher,
                        child: Text('Teacher'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        userInformations['role'] = value;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
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
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        userInformations['gender'] = value;
                      });
                    },
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '${userInformations['age'] == 10 ? '-10' : (userInformations['age'] == 50 ? '+50' : userInformations['age'])} years',
                      ),
                      Slider(
                        activeColor: Theme.of(context).primaryColor,
                        inactiveColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        value: userInformations['age'].toDouble(),
                        min: 10,
                        max: 50,
                        onChanged: (value) {
                          setState(() {
                            userInformations['age'] = value.toInt();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: (userInformations['role'] == Role.Student ? Container() : Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        value: userInformations['subject'],
                        items: getSubjects(),
                        onChanged: (value){
                          setState(() {
                            userInformations['subject'] = value;
                            userInformations['branch'] = branches[value].elementAt(0);
                          });
                        },
                      ),
                      DropdownButton<String>(
                        value: userInformations['branch'],
                        items: getBranches(userInformations['subject']),
                        onChanged: (value){
                          setState(() {
                            userInformations['branch'] = value;
                          });
                        },
                      )
                    ],
                  ),
                  Expanded(
                    child: FieldModel(
                      label: 'description',
                      text: userInformations['description'],
                      isArea: true,
                      onChanged: (value){
                        setState(() {
                          userInformations['description'] = value;
                        });
                      },
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: RaisedButton(
                  child: Text('Save Changes'),
                  elevation: 5.0,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FieldModel extends StatelessWidget {
  final String label, text;
  final IconData icon;
  final Function onChanged;
  bool isArea = false;

  FieldModel(
      {@required this.label, @required this.text, this.icon, this.onChanged, this.isArea});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(
        text: text,
      ),
      onChanged: onChanged,
      maxLines: isArea ? 5 : 1,
      decoration: InputDecoration(
        labelText: label,
        icon: Icon(
          icon,
        ),
      ),
    );
  }
}
