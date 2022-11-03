import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/shard.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 208,
      height: 160,
      margin: const EdgeInsets.only(top: 204),
      child: Column(
        children: [
          SvgUtils.svg('bill-no-data-icon'),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 12),
            child: const Text(
              '你还没有任何记账哦',
              style: TextStyle(
                  color: Color.fromRGBO(127, 124, 124, 1), fontSize: 14),
            ),
          ),
          RichText(
              text: const TextSpan(
                  text: '想记点什么？试试',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 191, 191, 1), fontSize: 16),
                  children: <TextSpan>[
                TextSpan(
                  text: '点击右下方按钮',
                  style: TextStyle(
                      color: Color.fromRGBO(253, 126, 126, 1), fontSize: 16),
                ),
                TextSpan(
                  text: '进行快速记账',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 191, 191, 1), fontSize: 16),
                ),
              ])),
        ],
      ),
    );
  }
}
