import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _swiperImageList = [
    'assets/images/avatar.jpeg',
    'assets/images/avatar.jpeg',
    'assets/images/avatar.jpeg',
  ];

  void _btnBuyPressed() {
    print('立即购买');
    showDialog(
      context: context,
      child: AlertDialog(
        backgroundColor: Color.fromRGBO(0, 39, 111, 1),
        // title: Text('购买成功'),
        content: Text('点击了立即购买'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context, 'cancel');
              print('cancel');
            },
            child: Text('取消'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context, 'ok');
              print('ok');
            },
            child: Text('确认'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: AppBar(elevation: 0), preferredSize: Size.fromHeight(0)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40, right: 16, bottom: 30, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('首页', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                Container(
                  height: 120,
                  margin: EdgeInsets.only(top: 5),
                  child: Swiper(
                    itemCount: 3,
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(image: AssetImage(_swiperImageList[index]), fit: BoxFit.cover),
                        ),
                      );
                    },
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        color: Color.fromRGBO(97, 97, 96, 1),
                        size: 8,
                        activeColor: Theme.of(context).accentColor,
                        activeSize: 8,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset('assets/images/icon-invited.png', width: 50, height: 50),
                        SizedBox(height: 10),
                        Text('邀请好友', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset('assets/images/icon-recharge.png', width: 50, height: 50),
                        SizedBox(height: 10),
                        Text('充币', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset('assets/images/icon-reward.png', width: 50, height: 50),
                        SizedBox(height: 10),
                        Text('收益', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(68, 245, 230, 1),
                        Color.fromRGBO(38, 0, 230, 1),
                      ]),
                      borderRadius: BorderRadius.circular(330),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(330),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('4.15～4.25', style: TextStyle(fontSize: 13)),
                          Text('天使期', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.8)),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(color: Theme.of(context).accentColor, height: 1.5),
                              children: [
                                TextSpan(text: '1000 ', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
                                TextSpan(text: '万枚CBL', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            margin: EdgeInsets.only(top: 10, right: 40, bottom: 24, left: 40),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(52, 70, 109, 1)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('限购量', style: TextStyle(fontSize: 13, color: Color.fromRGBO(134, 143, 142, 1))),
                                    Text('10000枚/人', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.8)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('天使价格', style: TextStyle(fontSize: 13, color: Color.fromRGBO(134, 143, 142, 1))),
                                    Text('0.1 USDT', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.8)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 145,
                            height: 45,
                            child: RaisedButton(
                              child: Text('立即购买', style: TextStyle(fontSize: 15)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              onPressed: _btnBuyPressed,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
