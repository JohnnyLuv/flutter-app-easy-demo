import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final Map arguments;
  UserList({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('user list')),
      body: Center(
        child: RaisedButton(
          child: Text("back to home page args: ${arguments['name']}"),
          onPressed: () {
            print(arguments['name']);
            print(arguments['age']);
            // Navigator.pushNamed(context, "/");
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
