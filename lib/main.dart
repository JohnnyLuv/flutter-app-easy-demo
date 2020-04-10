import 'package:flutter/material.dart';
import 'package:my_app/signIn.dart';
import 'package:my_app/signUp.dart';
import 'package:my_app/resetPwd.dart';
import 'package:my_app/home.dart';
import 'package:my_app/userList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'root',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(18, 26, 51, 1),
        scaffoldBackgroundColor: Color.fromRGBO(18, 26, 51, 1),
        accentColor: Color.fromRGBO(27, 255, 255, 1),
      ),
      initialRoute: '/signIn',
      routes: {
        '/home': (context) => Home(),
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        '/resetPwd': (context) => ResetPwd(),
        '/userList': (context) => UserList(),
      },
    );
  }
}
