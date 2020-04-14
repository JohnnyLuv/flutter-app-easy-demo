import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SetPayPwd extends StatefulWidget {
  SetPayPwd({Key key}) : super(key: key);

  @override
  _SetPayPwdState createState() => _SetPayPwdState();
}

class _SetPayPwdState extends State<SetPayPwd> {
  final _formKey = GlobalKey<FormState>();
  String _account, _password, _rePass, _captcha;
  bool _autoValidate = false;

  // 校验 _account
  String validateAccount(value) {
    switch (value) {
      case '':
        return '请输入账号';
      default:
        return null;
    }
  }

  // 校验 _password
  String validatePassword(value) {
    switch (value) {
      case '':
        return '请输入密码';
      default:
        return null;
    }
  }

  // 校验 _rePass
  String validateRePass(value) {
    switch (value) {
      case '':
        return '请再次输入密码';
      default:
        return null;
    }
  }

  // 校验 _captcha
  String validateCaptcha(value) {
    switch (value) {
      case '':
        return '请输入验证码';
      default:
        return null;
    }
  }

  // 表单 submit
  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print({
        '_account': _account,
        '_password': _password,
        '_rePass': _rePass,
        '_captcha': _captcha,
      });
      Fluttertoast.showToast(
        msg: "操作成功",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromRGBO(0, 0, 0, .5),
        fontSize: 16.0,
      );
      /* Timer(Duration(seconds: 2), () {
        print('timer');
      }); */
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('支付密码')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.only(top: 30, right: 15, bottom: 30, left: 15),
          children: <Widget>[
            Container(child: Text('当前账号'), margin: EdgeInsets.only(bottom: 5)),
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color.fromRGBO(2, 33, 98, 1),
                filled: true,
                contentPadding: EdgeInsets.all(15),
                hintText: '请输入手机号',
              ),
              validator: validateAccount,
              autovalidate: _autoValidate,
              onSaved: (value) => _account = value,
            ),
            Container(child: Text('支付密码'), margin: EdgeInsets.only(top: 30, bottom: 5)),
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color.fromRGBO(2, 33, 98, 1),
                filled: true,
                contentPadding: EdgeInsets.all(15),
                hintText: '请输入支付密码(6位数字)',
              ),
              validator: validatePassword,
              autovalidate: _autoValidate,
              onSaved: (value) => _password = value,
            ),
            Container(child: Text('确认支付密码'), margin: EdgeInsets.only(top: 30, bottom: 5)),
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color.fromRGBO(2, 33, 98, 1),
                filled: true,
                contentPadding: EdgeInsets.all(15),
                hintText: '请再次输入支付密码(6位数字)',
              ),
              validator: validateRePass,
              autovalidate: _autoValidate,
              onSaved: (value) => _rePass = value,
            ),
            Container(child: Text('验证码'), margin: EdgeInsets.only(top: 30, bottom: 5)),
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color.fromRGBO(2, 33, 98, 1),
                filled: true,
                contentPadding: EdgeInsets.all(15),
                hintText: '请输入验证码',
                suffixIcon: FlatButton(
                  child: Text('获取', style: TextStyle(fontSize: 14, color: Theme.of(context).accentColor)),
                  onPressed: () {},
                ),
              ),
              validator: validateCaptcha,
              autovalidate: _autoValidate,
              onSaved: (value) => _captcha = value,
            ),
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.only(top: 45),
              child: RaisedButton(
                child: Text('确  定', style: TextStyle(fontSize: 15)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                onPressed: _submitForm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
