import 'package:flutter/cupertino.dart';
import 'package:flutter_xiaomin/components/button/button.dart';
import 'package:flutter_xiaomin/components/input/input.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';
import 'package:flutter_xiaomin/components/verification_code_button/verification_code_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgetPasswordState();
  }
}

class ForgetPasswordState extends State<ForgetPassword> {
  _handlePressed() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenScaffold(
      title: '找回密码',
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Input(
              hitText: '请输入邮箱账号',
              margin: EdgeInsets.all(0),
            ),
            const Input(hitText: '请输入验证码', margin: EdgeInsets.all(0),suffixIcon: VerificationCodeButton(),),
            const Input(hitText: '请输入新的密码', margin: EdgeInsets.all(0)),
            const Input(hitText: '再次输入密码确认', margin: EdgeInsets.all(0)),
            const SizedBox(
              height: 32,
            ),
            Button(
                onPressed: _handlePressed,
                child: const SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Center(
                    child: Text('提交并登录'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
