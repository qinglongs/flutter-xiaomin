import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/components/button/button.dart';
import 'package:flutter_xiaomin/components/input/input.dart';
import 'package:flutter_xiaomin/components/user_avatar/user_avatar.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  bool _rememberPassword = false;
  bool _hiddenPassword = false;

  _handleLogin() {
    print('登录');
    Navigator.pushNamed(context, 'home');
  }

  _handleTapForgetPassword() {
    Navigator.pushNamed(context, 'forgetPassword');
  }

  _handleRegister() {
    Navigator.pushNamed(context, 'register');
  }

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      bodyPadding: const EdgeInsets.only(left: 48, right: 48),
      body: Column(
        children: [
          const UserAvatar(
            width: 89,
            height: 89,
            margin: EdgeInsets.only(top: 128, bottom: 42),
          ),
          const Input(
            hitText: '用户名',
            margin: EdgeInsets.only(top: 10),
          ),
          Input(
            hitText: '密码',
            margin: const EdgeInsets.only(top: 10),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _hiddenPassword = !_hiddenPassword;
                });
              },
              child: Icon(
                _hiddenPassword ? Icons.visibility : Icons.visibility_off,
                color: const Color.fromRGBO(127, 124, 124, 1),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _handleRegister,
                  child: const Text(
                    '注册',
                    style: TextStyle(
                        color: Color.fromRGBO(253, 126, 126, 1),
                        decoration: TextDecoration.underline),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _rememberPassword = !_rememberPassword;
                        });
                      },
                      child: Radio<bool>(
                        groupValue: false,
                        toggleable: true,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: const Color.fromRGBO(253, 126, 126, 1),
                        value: _rememberPassword,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberPassword = !_rememberPassword;
                          });
                        },
                      ),
                    ),
                    const Text(
                      '记住密码',
                      style: TextStyle(color: Color.fromRGBO(127, 124, 124, 1)),
                    ),
                  ],
                )
              ],
            ),
          ),
          Button(
            onPressed: _handleLogin,
            child: const SizedBox(
              width: double.infinity,
              height: 30,
              child: Center(
                child: Text('登录'),
              ),
            ),
          ),
          GestureDetector(
            onTap: _handleTapForgetPassword,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '忘记密码？',
                  style: TextStyle(
                      color: Color.fromRGBO(127, 124, 124, 1), fontSize: 12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
