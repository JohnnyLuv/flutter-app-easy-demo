import 'package:flutter/material.dart';
import 'package:my_app/views/invite.dart';
import 'package:my_app/views/user/setPayPwd.dart';
import 'package:my_app/views/user/signIn.dart';
import 'package:my_app/views/user/signUp.dart';
import 'package:my_app/views/user/resetPwd.dart';
import 'package:my_app/views/layout.dart';
import 'package:my_app/views/qrCode.dart';

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
      routes: {
        '/signIn': (context) => SignIn(), // 登录
        '/signUp': (context) => SignUp(), // 注册
        '/resetPwd': (context) => ResetPwd(), // 重置密码
        '/index': (context) => Layout(), // 首页
        '/setPayPwd': (context) => SetPayPwd(), // 设置支付密码
        '/qrCode': (context) => QRCode(), // 测试扫码组件
        '/invite': (context) => Invite(), // 邀请好友
      },
    );
  }
}
