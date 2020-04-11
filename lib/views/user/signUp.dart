import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signInFormKey = GlobalKey<FormState>(); // 表单key
  bool autoValidate = false; // 自动校验
  String account, password, rePass, captcha;
  bool pwdEye = true; // 密码是否可见
  bool rePwdEye = true; // 确认密码是否可见
  bool agreementCheckbox = true;

  // 校验 account
  String validateAccount(value) {
    if (value.isEmpty) {
      return '请输入用户名';
    } else {
      return null;
    }
  }

  // 校验 password
  String validatePassword(value) {
    if (value.isEmpty) {
      return '请输入密码';
    } else {
      return null;
    }
  }

  // 校验 rePass
  String validateRePass(value) {
    if (value.isEmpty) {
      return '请再次输入密码';
    } else {
      return null;
    }
  }

  // 校验 captcha
  String validateCaptcha(value) {
    if (value.isEmpty) {
      return '请输入验证码';
    } else {
      return null;
    }
  }

  // 表单 submit
  void submitSignInForm() {
    if (signInFormKey.currentState.validate()) {
      // 表单校验成功 保存获取表单内容
      signInFormKey.currentState.save();
      print({
        'account': account,
        'password': password,
        'rePass': rePass,
        'captcha': captcha,
      });
    } else {
      // 表单校验失败 开启自动校验
      setState(() {
        autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 设置没有返回按钮
        actions: <Widget>[
          FlatButton(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '已有账号？'),
                  TextSpan(text: '登录', style: TextStyle(fontSize: 14, color: Theme.of(context).accentColor))
                ],
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: signInFormKey,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 30, bottom: 60),
                child: Text('注册', style: TextStyle(fontSize: 25, color: Theme.of(context).accentColor)),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '请输入手机号'),
                validator: validateAccount,
                autovalidate: autoValidate,
                onSaved: (value) => account = value,
              ),
              SizedBox(height: 40),
              TextFormField(
                obscureText: pwdEye,
                decoration: InputDecoration(
                  hintText: '请输入密码',
                  suffixIcon: IconButton(
                    icon: Icon(pwdEye ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => pwdEye = !pwdEye),
                  ),
                ),
                validator: validatePassword,
                autovalidate: autoValidate,
                onSaved: (value) => password = value,
              ),
              SizedBox(height: 40),
              TextFormField(
                obscureText: rePwdEye,
                decoration: InputDecoration(
                  hintText: '请确认密码',
                  suffixIcon: IconButton(
                    icon: Icon(rePwdEye ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => rePwdEye = !rePwdEye),
                  ),
                ),
                validator: validateRePass,
                autovalidate: autoValidate,
                onSaved: (value) => rePass = value,
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '请输入验证码',
                  suffixIcon: FlatButton(
                    child: Text('获取', style: TextStyle(fontSize: 12, color: Theme.of(context).accentColor)),
                    onPressed: () => print('获取验证码'),
                  ),
                ),
                validator: validateCaptcha,
                autovalidate: autoValidate,
                onSaved: (value) => captcha = value,
              ),
              Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 45),
                child: RaisedButton(
                  child: Text('确  定', style: TextStyle(fontSize: 15)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  onPressed: submitSignInForm,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: agreementCheckbox,
                    onChanged: (value) => setState(() => agreementCheckbox = value),
                  ),
                  Text('注册即同意', style: TextStyle(fontSize: 12, color: Color.fromRGBO(134, 143, 142, 1))),
                  Text('《用户协议》', style: TextStyle(fontSize: 12, color: Theme.of(context).accentColor)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
