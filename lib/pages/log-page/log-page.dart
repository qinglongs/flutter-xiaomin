import 'package:flutter/material.dart';
import '../../components/app-bar/app-bar.dart';
import '../../components/show-action/show-action.dart';
import '../../service/log.dart';

class LogPage extends StatelessWidget {
  // 点击删除日志
  _onPressedDelete(context, {Map params}) {
    return () {
      actionSheet.showConfirm(context, content: '确认删除?', onConfrim: () async {
        await deleteLog({'id': params['id']});
        actionSheet.showToast(msg: '删除成功！');
        Navigator.pop(context, 'xxx');
      });
    };
  }

  _onTapPreviewImage(BuildContext context, Map params) {
    return () {
      actionSheet.showModal(context, showContent: Image.asset(params['image']));
    };
  }

  @override
  Widget build(BuildContext context) {
    // 接收路由参数
    Map params = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: appBar(context, title: params['title'], action: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: _onPressedDelete(context, params: params),
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
                      child: SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: GestureDetector(
                            onTap: _onTapPreviewImage(context, params),
                            child: params['image'].indexOf('http') > -1
                                ? Image.network(
                                    params['image'],
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    params['image'],
                                    fit: BoxFit.cover,
                                  ),
                          ))),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(params['content'] * 100),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
