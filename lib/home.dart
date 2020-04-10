import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home')),
      body: Center(
        child: RaisedButton(
          child: Text('route to userList page'),
          onPressed: () {
            // Navigator.pushNamed(context, '/userList);
            Navigator.pushNamed(context, '/userList', arguments: 'johnny');
          },
        ),
      ),
    );
  }
}
