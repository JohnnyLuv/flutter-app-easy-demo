import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  Wallet({Key key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool _walletVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40, right: 16, bottom: 30, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('资产', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                Container(
                  padding: EdgeInsets.only(top: 15, right: 15, bottom: 30, left: 15),
                  margin: EdgeInsets.only(top: 5, bottom: 30),
                  decoration: BoxDecoration(color: Color.fromRGBO(0, 39, 111, 1), borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('总资产折合（USDT）'),
                          IconButton(
                            icon: Icon(_walletVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => setState(() => _walletVisible = !_walletVisible),
                          ),
                        ],
                      ),
                      Text(_walletVisible ? '998.00' : '******', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Theme.of(context).accentColor)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset('assets/images/icon-recharge.png', width: 50, height: 50),
                        SizedBox(height: 10),
                        Text('充币', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset('assets/images/icon-transfer.png', width: 50, height: 50),
                        SizedBox(height: 10),
                        Text('转账', style: TextStyle(fontSize: 12)),
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
                Container(
                  padding: EdgeInsets.only(top: 30, right: 15, bottom: 30, left: 15),
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(color: Color.fromRGBO(0, 39, 111, 1), borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('我的团队', style: TextStyle(fontSize: 12, color: Color.fromRGBO(134, 143, 142, 1))),
                          Expanded(child: Text('7', textAlign: TextAlign.right, style: TextStyle(fontSize: 13))),
                          Icon(Icons.chevron_right, color: Color.fromRGBO(134, 143, 142, 1)),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Text('我的收益', style: TextStyle(fontSize: 12, color: Color.fromRGBO(134, 143, 142, 1))),
                          Expanded(child: Text('998.00', textAlign: TextAlign.right, style: TextStyle(fontSize: 13))),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, right: 15, bottom: 30, left: 15),
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(color: Color.fromRGBO(0, 39, 111, 1), borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('币种', style: TextStyle(fontSize: 12, color: Color.fromRGBO(134, 143, 142, 1))),
                          Text('数量', style: TextStyle(fontSize: 12, color: Color.fromRGBO(134, 143, 142, 1))),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/icon-logo.png', width: 18, height: 18),
                          Text('  USDT'),
                          Expanded(child: Text('998.00', textAlign: TextAlign.right)),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/icon-logo.png', width: 18, height: 18),
                          Text('  USDT'),
                          Expanded(child: Text('998.00', textAlign: TextAlign.right)),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(top: 5),
                        child: Text('1 CBL ≈ 0.1 USDT', style: TextStyle(fontSize: 12, color: Color.fromRGBO(134, 143, 142, 1))),
                      ),
                    ],
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
