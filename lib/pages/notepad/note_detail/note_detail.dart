import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState();
  }
}

class NoteDetailState extends State<NoteDetail> {
  String text =
      '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ScreenScaffold(
      title: '事件详情',
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border:
                  Border.all(color: const Color.fromRGBO(253, 126, 126, 1))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('2022年3月1日',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                    Text(
                      '日记',
                      style: TextStyle(
                          color: Color.fromRGBO(253, 126, 126, 1),
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: Text(text),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.only(bottom: 32),
                color: Colors.pinkAccent,
                child: const Center(
                  child: Text('图片'),
                ),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.only(bottom: 32),
                color: Colors.lightBlueAccent,
                child: const Center(
                  child: Text('视频'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
