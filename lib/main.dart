import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/screens/profile.dart';
import 'package:flutter_ibmchallenge/services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          Provider<AuthService>.value(value: AuthService()),
          StreamProvider<User>.value(
            initialData: User(firebaseUser: null, roles: []),
            value: AuthService().user,
          ),
          FutureProvider<UserFromFuture>.value(
            initialData: UserFromFuture(firebaseUser: null, claims: {}, roles: []),
            value: AuthService().getUser,
          )
        ],
        child: MaterialApp(
          home: LoginScreen(),
          routes: {
            'profile': (context) => ProfileScreen(),
          },
        ),
      );
  }
}