import 'package:flutter/material.dart';
import 'package:my_app/routes/routes.dart';

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
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: TextStyle(fontSize: 17)),
          elevation: 0,
        ),
      ),
      initialRoute: '/invite',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
