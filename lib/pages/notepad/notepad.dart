import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/pages/notepad/components/background_image/background_image.dart';
import 'package:flutter_xiaomin/pages/notepad/components/user_card/user_card.dart';

import './components/background_image/background_image.dart';
import './components/no_data/no_data.dart';

import '../../utils/shard.dart';

class Notepad extends StatelessWidget {
  const Notepad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: const [
        //背景
        Positioned(
          top: 0,
          left: 0,
          child: BackgroundImage(),
        ),
        //用户卡片
        Positioned(
          top: 196,
          left: 0,
          child: UserCard(),
        ),
        // 无数据展示
        Positioned(
            top: 232,
            left: 0,
            child: NoData(),
        ),

      ],
    );
  }
}
