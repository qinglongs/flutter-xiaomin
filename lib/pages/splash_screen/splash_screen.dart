import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/components/user_avatar/user_avatar.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';
import 'package:flutter_xiaomin/pages/splash_screen/components/skip/skip.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  handleSkip() {
    Navigator.pushNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenScaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Skip(
              handleSkip: handleSkip,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 32, top: 200),
            child: const UserAvatar(
              width: 99,
              height: 99,
            ),
          ),
          const Text(
            '小敏日记',
            style: TextStyle(
                fontSize: 48,
                color: Color.fromRGBO(253, 126, 126, 1),
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
