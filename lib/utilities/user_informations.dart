import 'package:flutter_ibmchallenge/utilities/gender_enum.dart';
import 'package:flutter_ibmchallenge/utilities/role_enum.dart';

Map<String, dynamic> getUserInformations() {
  Map<String, dynamic> userInformations = {
    'picture':
    'http://4.bp.blogspot.com/-eEASWO3Ekfk/UfgyY3vzS8I/AAAAAAAAAUI/SP4LRqnSBzM/s1600/Spongebob.jpg',
    'first name': 'Ayman',
    'last name': 'Riad Solh',
    'username': 'aymanrs',
    'email': 'ayman.riad.solh56@gmail.com',
    'age': 12,
    'gender': Gender.Male,
    'password': '12345678',
    'role': Role.Student,
  };
  //TODO: get user informations as a map
  return userInformations;
}
