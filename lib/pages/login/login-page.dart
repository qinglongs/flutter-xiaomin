import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  _handleLogin() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenScaffold(
      bodyPadding: const EdgeInsets.only(left: 48, right: 48),
      body: Column(
        children: [
          const UserAvatar(
            width: 89,
            height: 89,
            margin: EdgeInsets.only(top: 128, bottom: 42),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: "用户名",
              hintStyle: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(191, 191, 191, 1)),
              errorBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(217, 217, 217, 1))),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(217, 217, 217, 1))),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(217, 217, 217, 1), width: 1),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(191, 191, 191, 1)),
                hintText: "密码",
                errorBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(217, 217, 217, 1))),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(217, 217, 217, 1))),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 1), width: 1),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '注册',
                  style: TextStyle(
                      color: Color.fromRGBO(253, 126, 126, 1),
                      decoration: TextDecoration.underline),
                ),
                Text(
                  '记住密码',
                  style: TextStyle(color: Color.fromRGBO(127, 124, 124, 1)),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: _handleLogin,
            child: const SizedBox(
              width: double.infinity,
              height: 30,
              child: Center(
                child: Text('登录'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
