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
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            width: size.width,
            height: 232,
            child: const BackgroundImage(),
          ),
        ),
        const Positioned(
          top: 196,
          left: 0,
          child: UserCard(),
        ),
        Positioned(
            top: 232,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: size.height - 200,
              child: const NoData(),
            ))
      ],
    );
  }
}
