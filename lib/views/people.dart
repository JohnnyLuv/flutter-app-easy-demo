import 'package:flutter/material.dart';

class People extends StatefulWidget {
  People({Key key}) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('我的 people page'),
      ),
    );
  }
}
