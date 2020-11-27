import 'package:flutter/material.dart';
import './pages/add-log/add-log.dart';
import './pages/log-page/log-page.dart';

// 路由配置文件
class MyRouter {
  // 私有方法,获取需要跳转的页面
  _getPage({String url, dynamic params}) {
    switch (url) {
      case 'add-log':
        return AddLog();
        break;
      case 'log-page':
        return LogPage(
          routerNum: params as String,
        );
    }
  }

  // push方法
  push({BuildContext context, String url, dynamic params}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url: url, params: params);
    }));
  }
}
