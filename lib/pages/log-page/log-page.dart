import 'package:flutter/material.dart';
import '../../components/app-bar/app-bar.dart';

class LogPage extends StatelessWidget {
  // 用来接收路由参数
  final String routerNum;

  //构造函数接收参数
  LogPage({this.routerNum});

  _onPressedDelete() {
    print('删除');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: routerNum, action: [
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
          '日记详情',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
