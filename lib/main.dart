import 'package:flutter/material.dart';
import 'package:flutter_ibmchallenge/screens/create_account_screen.dart';
import 'package:flutter_ibmchallenge/screens/forgot_password_screen.dart';
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
          initialData:
              UserFromFuture(firebaseUser: null, claims: {}, roles: []),
          value: AuthService().getUser,
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.deepOrange,
          scaffoldBackgroundColor: Color(0xFF36446F),
          accentColor: Colors.deepOrangeAccent,
        ),
        home: LoginScreen(),
        routes: {
          'profile': (context) => ProfileScreen(),
          'sign up': (context) => CreateAnAccountScreen(),
          'login screen': (context) => LoginScreen(),
          'forgot password': (context) => ForgotPasswordScreen(),
        },
      ),
    );
  }
}
