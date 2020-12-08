import 'package:flutter/material.dart';
import '../../components/app-bar/app-bar.dart';

class LogPage extends StatelessWidget {
  // 用来接收路由参数
  final Map params;

  //构造函数接收参数
  LogPage({this.params});

  // 点击删除日志
  _onPressedDelete() {
    print('删除');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: params['title'], action: [
        Padding(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            child: Text('删除'),
            onPressed: _onPressedDelete,
          ),
        )
      ]),
      body: Center(
        child: Text(
          params['content'],
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
