import 'package:flutter/material.dart';
import 'package:my_app/views/home.dart';
import 'package:my_app/views/people.dart';
import 'package:my_app/views/wallet.dart';

class Layout extends StatefulWidget {
  Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _bottomBarIndex = 0;

  List<Widget> _viewList = [
    Home(),
    Wallet(),
    People(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _viewList[_bottomBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(0, 14, 40, 1),
        currentIndex: _bottomBarIndex,
        onTap: (index) => setState(() => _bottomBarIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), title: Text('资产')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
      ),
    );
  }
}
