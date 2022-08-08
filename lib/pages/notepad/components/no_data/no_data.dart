import 'package:flutter/material.dart';

import 'package:flutter_xiaomin/utils/shard.dart';

class NoData extends StatefulWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoDataState();
  }
}

class NoDataState extends State<NoData> {

  // 点击立即发布
  _onPressed() {
    Navigator.pushNamed(context, 'addNote');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return SizedBox(
      width: size.width,
      height: size.height - 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgUtils.svg('notepad-no-data'),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: const Text('暂无事件',
                style: TextStyle(color: Color.fromRGBO(127, 124, 124, 1))),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(10),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 15),
                  backgroundColor: const Color.fromRGBO(253, 126, 126, 1),
                ),
                onPressed: _onPressed,
                child: const Text('立即创建')),
          )
        ],
      ),
    );
  }
}
