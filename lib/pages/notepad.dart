import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

import '../utils/shard.dart';

class Notepad extends StatelessWidget {
  const Notepad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _onPressed() {}

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Utils.svg('notepad-no-data'),
          Container(
            margin: const EdgeInsets.fromLTRB(0,10,0,0),
            child: const Text('发布你的第一篇笔记',style:TextStyle(color: Color.fromRGBO(127, 124, 124, 1))),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0,10,0,0),
            child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(10),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 15),
                  backgroundColor: const Color.fromRGBO(253, 126, 126, 1),
                ),
                onPressed: _onPressed,
                child: const Text('立即发布')),
          )
        ],
      ),
    );
  }
}
