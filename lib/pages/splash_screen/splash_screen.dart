import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/components/user_avatar/user_avatar.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';
import 'package:flutter_xiaomin/pages/splash_screen/components/skip/skip.dart';
import 'package:provider/provider.dart';

import '../../providers/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  handleSkip() {
    Navigator.pushNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    final themOptions = context.watch<GlobalTheme>();
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
          Text(
            '小敏日记',
            style: TextStyle(
                fontSize: 48,
                color: themOptions.themeColor,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
