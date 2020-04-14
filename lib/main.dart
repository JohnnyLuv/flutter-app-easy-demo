import 'package:flutter/material.dart';
import 'package:my_app/views/user/setPayPwd.dart';
import 'package:my_app/views/user/signIn.dart';
import 'package:my_app/views/user/signUp.dart';
import 'package:my_app/views/user/resetPwd.dart';
import 'package:my_app/views/layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'root',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(2, 25, 72, 1),
        scaffoldBackgroundColor: Color.fromRGBO(2, 25, 72, 1),
        accentColor: Color.fromRGBO(27, 255, 255, 1),
      ),
      initialRoute: '/index',
      routes: {
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        '/resetPwd': (context) => ResetPwd(),
        '/index': (context) => Layout(),
        '/setPayPwd': (context) => SetPayPwd(),
      },
    );
  }
}
