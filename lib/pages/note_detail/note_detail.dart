import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return const ScreenScaffold(
      title: '事件详情',
      body: Text('事件详情'),
    );
  }
}
