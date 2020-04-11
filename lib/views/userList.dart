import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('user list')),
      body: Center(
        child: RaisedButton(
          child: Text('back to home page args: $args'),
          onPressed: () {
            // Navigator.pushNamed(context, "/");
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
