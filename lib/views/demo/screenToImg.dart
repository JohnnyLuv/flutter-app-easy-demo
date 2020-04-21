import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenToImg extends StatefulWidget {
  ScreenToImg({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenToImg> {
  GlobalKey rootWidgetKey = GlobalKey();

  List<Uint8List> images = List();
  var img;

  _capturePng() async {
    try {
      RenderRepaintBoundary boundary = rootWidgetKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      setState(() {
        img = image;
      });
      return pngBytes;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: rootWidgetKey,
      child: Scaffold(
        appBar: AppBar(title: Text('screen to img')),
        body: Column(
          children: <Widget>[
            Image.asset("assets/images/avatar.jpeg", width: 200, height: 200),
            RaisedButton(
              child: Text('保存'),
              onPressed: () {
                _capturePng();
              },
            ),
          ],
        ),
      ),
    );
  }
}
