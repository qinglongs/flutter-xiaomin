import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/components/button/button.dart';
import 'package:flutter_xiaomin/components/input/input.dart';
import 'package:flutter_xiaomin/components/user_avatar/user_avatar.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';
import 'package:flutter_xiaomin/components/verification_code_button/verification_code_button.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  bool _rememberPassword = false;
  bool _hiddenPassword = false;

  _handleLogin() {
    print('注册');
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
          const Input(
            hitText: '请输入验证码',
            margin: EdgeInsets.only(top: 10),
            suffixIcon: VerificationCodeButton(),
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
                  _hiddenPassword ? Icons.visibility : Icons.visibility_off),
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
                child: Text('注册'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
