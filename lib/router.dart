import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './pages/add-log/add-log.dart';
import './pages/log-page/log-page.dart';

// 路由配置文件
class MyRouter {
  // 私有方法,获取需要跳转的页面
  _getPage({String url, dynamic params}) {
    switch (url) {
      case 'add-log':
        return AddLogState(
          image: params as PickedFile,
        );
        break;
      case 'log-page':
        return LogPage(
          params: params,
        );
    }
  }

  // push方法
  void push({BuildContext context, String url, params}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url: url, params: params);
    }));
  }

  // 路由回退
  goback(BuildContext context) {
    Navigator.of(context).pop();
  }
}

// 实例化路由对象
final myRouter = MyRouter();
