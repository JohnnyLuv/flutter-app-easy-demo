import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:my_app/components/dashBorder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class Invite extends StatefulWidget {
  Invite({Key key}) : super(key: key);

  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  ScreenshotController _screenshotController = ScreenshotController();
  File _imageFile;

  void _getScreenshot() async {
    var _storageStatus = await Permission.storage.status;
    print(_storageStatus);
    if (_storageStatus == PermissionStatus.granted) {
      print('granted,granted,granted');

      _imageFile = null;
      _screenshotController.capture(pixelRatio: 1.5).then((File image) async {
        print('Capture Done');
        setState(() {
          _imageFile = image;
        });
        final result = await ImageGallerySaver.saveImage(image.readAsBytesSync());
        print('File saved to Gallery: $result');
        Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: "保存成功");
      }).catchError((onError) {
        print(onError);
      });
    } else {
      print('isUndetermined,isUndetermined,isUndetermined');
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print(statuses[Permission.location]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('邀请好友')),
      body: ListView(
        padding: EdgeInsets.only(top: 20, bottom: 45, left: 20, right: 20),
        children: <Widget>[
          Screenshot(
            controller: _screenshotController,
            child: PhysicalModel(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              clipBehavior: Clip.antiAlias,
              child: Column(
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
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
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
                    height: 20,
                    child: Stack(
                      children: <Widget>[
                        Positioned(child: DashBorder(color: Color.fromRGBO(217, 217, 217, 1)), top: 9.5, left: 10, right: 10),
                        Positioned(child: Container(width: 20, height: 20, decoration: BoxDecoration(color: Color.fromRGBO(2, 25, 72, 1), borderRadius: BorderRadius.circular(20))), top: 0, left: -10),
                        Positioned(child: Container(width: 20, height: 20, decoration: BoxDecoration(color: Color.fromRGBO(2, 25, 72, 1), borderRadius: BorderRadius.circular(20))), top: 0, right: -10),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  QrImage(data: 'baidu.com', size: 140, padding: EdgeInsets.all(0)),
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
                  SizedBox(height: 10),
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
                          onPressed: _getScreenshot,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(margin: EdgeInsets.only(top: 30), alignment: Alignment.center, child: Text('邀请好友注册吧！')),
          _imageFile != null ? Image.file(_imageFile) : Text('还没有截图哦'),
        ],
      ),
    );
  }
}
