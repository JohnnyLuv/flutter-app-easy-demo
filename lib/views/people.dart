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
      appBar: PreferredSize(
        child: AppBar(backgroundColor: Color.fromRGBO(0, 39, 111, 1), elevation: 0),
        preferredSize: Size.fromHeight(0),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 35, right: 16, bottom: 35, left: 16),
              decoration: BoxDecoration(color: Color.fromRGBO(0, 39, 111, 1)),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 15),
                    child: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.jpeg')),
                  ),
                  Text('13788888888', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: BoxDecoration(color: Color.fromRGBO(0, 39, 111, 1), borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.group_add, color: Color.fromRGBO(134, 143, 142, 1)),
                    SizedBox(width: 15),
                    Expanded(child: Text('邀请好友', style: TextStyle(fontSize: 15))),
                    Icon(Icons.chevron_right, color: Color.fromRGBO(134, 143, 142, 1)),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/invite');
              },
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: BoxDecoration(color: Color.fromRGBO(0, 39, 111, 1), borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.lock_outline, color: Color.fromRGBO(134, 143, 142, 1)),
                    SizedBox(width: 15),
                    Expanded(child: Text('支付密码', style: TextStyle(fontSize: 15))),
                    Text('未设置', style: TextStyle(fontSize: 12, color: Color.fromRGBO(134, 143, 142, 1))),
                    Icon(Icons.chevron_right, color: Color.fromRGBO(134, 143, 142, 1)),
                  ],
                ),
              ),
              onTap: () => Navigator.pushNamed(context, '/setPayPwd'),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              decoration: BoxDecoration(color: Color.fromRGBO(0, 39, 111, 1), borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.info_outline, color: Color.fromRGBO(134, 143, 142, 1)),
                        SizedBox(width: 15),
                        Expanded(child: Text('关于我们', style: TextStyle(fontSize: 15))),
                        Icon(Icons.chevron_right, color: Color.fromRGBO(134, 143, 142, 1)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.call, color: Color.fromRGBO(134, 143, 142, 1)),
                        SizedBox(width: 15),
                        Expanded(child: Text('联系我们', style: TextStyle(fontSize: 15))),
                        Icon(Icons.chevron_right, color: Color.fromRGBO(134, 143, 142, 1)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.cloud_upload, color: Color.fromRGBO(134, 143, 142, 1)),
                        SizedBox(width: 15),
                        Expanded(child: Text('检查更新', style: TextStyle(fontSize: 15))),
                        Text('当前 V101', style: TextStyle(fontSize: 12, color: Color.fromRGBO(134, 143, 142, 1))),
                        Icon(Icons.chevron_right, color: Color.fromRGBO(134, 143, 142, 1)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              padding: EdgeInsets.only(left: 40, right: 40),
              margin: EdgeInsets.only(top: 30),
              child: OutlineButton(
                child: Text('退出登录', style: TextStyle(fontSize: 15)),
                borderSide: BorderSide(color: Color.fromRGBO(134, 143, 142, 1)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
