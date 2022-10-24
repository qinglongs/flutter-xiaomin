import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/pages/notepad/components/background_image/background_image.dart';
import 'package:flutter_xiaomin/pages/notepad/components/note_card/note_card.dart';
import 'package:flutter_xiaomin/pages/notepad/components/user_card/user_card.dart';

import './components/no_data/no_data.dart';

class Notepad extends StatelessWidget {
  Notepad({Key? key}) : super(key: key);

  final List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 286,
            child: Stack(
              children: const [
                BackgroundImage(),
                Positioned(top: 195, left: 0, child: UserCard())
              ],
            ),
          ),
          ...list
              .map((e) => Container(
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: const NoteCard(),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
