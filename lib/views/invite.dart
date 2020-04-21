import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/components/dashBorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Invite extends StatefulWidget {
  Invite({Key key}) : super(key: key);

  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  GlobalKey _inviteGlobalKey = GlobalKey();
  Future _screenToImage() async {
    try {
      RenderRepaintBoundary _boundary = _inviteGlobalKey.currentContext.findRenderObject();
      var image = await _boundary.toImage(pixelRatio: window.devicePixelRatio);
      ByteData _byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List _pngBytes = _byteData.buffer.asUint8List();
      String _tempDirPath = (await getTemporaryDirectory()).path;
      bool isDirExist = await Directory(_tempDirPath).exists();
      if (!isDirExist) {
        Directory(_tempDirPath).create();
      }
      Future<File> _file = File('$_tempDirPath/invited.png').writeAsBytes(_pngBytes);
      return _file;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('邀请好友')),
      body: RepaintBoundary(
        key: _inviteGlobalKey,
        child: ListView(
          padding: EdgeInsets.only(top: 20, bottom: 45, left: 20, right: 20),
          children: <Widget>[
            Container(
              child: Text('我的邀请', style: TextStyle(fontSize: 15)),
              height: 50,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(68, 245, 230, 1),
                    Color.fromRGBO(38, 0, 230, 1),
                  ],
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7)),
              ),
            ),
            Container(
              height: 90,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('邀请码：', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromRGBO(2, 26, 75, 1))),
                  Text('QWERTY', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Color.fromRGBO(45, 161, 151, 1))),
                  IconButton(
                    icon: Icon(Icons.content_copy),
                    iconSize: 20,
                    color: Color.fromRGBO(45, 161, 151, 1),
                    onPressed: () {
                      print('复制拉');
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 20,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 9.5,
                    left: 10,
                    right: 10,
                    child: DashBorder(color: Color.fromRGBO(217, 217, 217, 1)),
                  ),
                  Positioned(
                    top: 0,
                    left: -10,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(color: Color.fromRGBO(2, 25, 72, 1), borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: -10,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(color: Color.fromRGBO(2, 25, 72, 1), borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7), bottomRight: Radius.circular(7))),
              child: Column(
                children: <Widget>[
                  QrImage(
                    data: 'baidu.com',
                    size: 140,
                    padding: EdgeInsets.all(0),
                  ),
                  SizedBox(height: 20),
                  Text('扫描二维码注册下载 APP', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromRGBO(2, 26, 75, 1))),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 220,
                        padding: EdgeInsets.only(left: 40),
                        child: Text('https://h5.sdfsshell.com/?code=ARfDL7A', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromRGBO(2, 26, 75, 1))),
                      ),
                      IconButton(
                        icon: Icon(Icons.content_copy),
                        iconSize: 20,
                        color: Color.fromRGBO(45, 161, 151, 1),
                        onPressed: () {
                          print('复制拉');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          child: Text('复制链接', style: TextStyle(fontSize: 14, color: Color.fromRGBO(45, 161, 151, 1))),
                          onPressed: () {
                            print('复制链接拉');
                          },
                        ),
                      ),
                      Container(width: 1.5, height: 13, decoration: BoxDecoration(color: Color.fromRGBO(134, 143, 142, 1))),
                      Expanded(
                        child: FlatButton(
                          child: Text('保存图片', style: TextStyle(fontSize: 14, color: Color.fromRGBO(45, 161, 151, 1))),
                          onPressed: () {
                            print('保存图片拉');
                            Fluttertoast.showToast(
                              msg: "保存成功",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 16.0,
                            );
                            _screenToImage().then((resultImg) {
                              print(resultImg);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(margin: EdgeInsets.only(top: 30), alignment: Alignment.center, child: Text('邀请好友注册吧！')),
          ],
        ),
      ),
    );
  }
}
