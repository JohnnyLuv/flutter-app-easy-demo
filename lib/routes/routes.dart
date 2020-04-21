import 'package:flutter/material.dart';
import 'package:my_app/views/demo/qrCode.dart';
import 'package:my_app/views/demo/screenToImg.dart';
import 'package:my_app/views/invite.dart';
import 'package:my_app/views/layout.dart';
import 'package:my_app/views/user/resetPwd.dart';
import 'package:my_app/views/user/setPayPwd.dart';
import 'package:my_app/views/user/signIn.dart';
import 'package:my_app/views/user/signUp.dart';
import 'package:my_app/views/userList.dart';

final routes = {
  '/signIn': (context) => SignIn(), // 登录
  '/signUp': (context) => SignUp(), // 注册
  '/resetPwd': (context) => ResetPwd(), // 重置密码
  '/index': (context) => Layout(), // 首页
  '/setPayPwd': (context) => SetPayPwd(), // 设置支付密码
  '/invite': (context) => Invite(), // 邀请好友

  '/userList': (context,{arguments}) => UserList(arguments:arguments), // 用户列表
  '/qrCode': (context) => QRCode(), // 测试扫码组件
  '/screenToImg': (context) => ScreenToImg(), // 测试截屏
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
