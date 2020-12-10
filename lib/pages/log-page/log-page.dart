import 'package:flutter/material.dart';
import '../../components/app-bar/app-bar.dart';
import '../../components/show-action/show-action.dart';
import '../../service/log.dart';

class LogPage extends StatelessWidget {
  // 用来接收路由参数
  final Map params;

  //构造函数接收参数
  LogPage({this.params});

  // 点击删除日志
  _onPressedDelete(context) {
    return () {
      actionSheet.showConfirm(context, content: '确认删除?', onConfrim: () async {
        await deleteLog({'id': params['id']});
        actionSheet.showToast(msg: '删除成功！');
        Navigator.pop(context);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, title: params['title'], action: [
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              child: Text('删除'),
              onPressed: _onPressedDelete(context),
            ),
          )
        ]),
        // https://book.flutterchina.club/chapter6/intro.html
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              // padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      child: Image.network(
                        params['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(params['content'] * 10000),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
