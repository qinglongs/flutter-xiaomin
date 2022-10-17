import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/pages/notepad/components/background_image/background_image.dart';
import 'package:flutter_xiaomin/pages/notepad/components/note_card/note_card.dart';
import 'package:flutter_xiaomin/pages/notepad/components/user_card/user_card.dart';

import './components/no_data/no_data.dart';

class Notepad extends StatelessWidget {
  const Notepad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        //背景
        const Positioned(
          top: 0,
          left: 0,
          child: BackgroundImage(),
        ),
        //用户卡片
        const Positioned(
          top: 196,
          left: 0,
          child: UserCard(),
        ),
        // 无数据展示
        // Positioned(
        //     top: 232,
        //     left: 0,
        //     child: NoData(),
        // ),
        Positioned(
          top: 270,
          left: 0,
          child: Container(
            height: 500,
            color: Colors.pinkAccent,
            padding: const EdgeInsets.only(left: 16,right: 16),
            width: size.width,
            child: ListView(
              children: const [
                NoteCard(),
                NoteCard(),
                NoteCard(),
                NoteCard(),
                NoteCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
