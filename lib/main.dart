import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import './pages/log-page/log-page.dart';
import './pages/add-log/add-log.dart';

import './home-page/log-list/log-list.dart';
import './home-page/drawer/drawer.dart';
import './home-page/bill/bill.dart';

import './components/open-camera/open-camera.dart';

import './utils/theme-config.dart';

final routes = {
  'log-page': (context) => LogPage(),
  'add-log': (context) => AddLogState(),
};

// 主题色
final pink = Colors.pink[300];

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // 底部tab索引
  int _currentIndex = 0;

  // 点击+号按钮
  _onPressAdd() {
    openMyCamera.tapPickImage(context, (PickedFile img) {
      Navigator.pushNamed(context, 'add-log', arguments: img).then((value) {
        if (value != null) childKey.currentState.fetchList(refresh: true);
      });
    });
  }

  // 长按+号按钮
  _onLongPressAdd() {
    Navigator.pushNamed(context, 'add-log').then((value) {
      if (value != null) childKey.currentState.fetchList(refresh: true);
    });
  }

  @override
  build(BuildContext context) {
    // 浮动按钮list
    final List<Widget> floatButtonList = [
      FloatingActionButton(
          child: GestureDetector(
            onLongPress: _onLongPressAdd,
            child: Icon(Icons.add, color: Colors.white),
          ),
          onPressed: _onPressAdd),
      FloatingActionButton(
          child: GestureDetector(
            onLongPress: _onLongPressAdd,
            child: Icon(Icons.create, color: Colors.white),
          ),
          onPressed: _onPressAdd),
      null
    ];

    // 底部tab栏渲染和需要渲染的内容
    final List<Map> tableList = [
      {
        'title': '日记',
        'render': Loglist(key: childKey),
        'index': 0,
        'icon': Icon(Icons.home)
      },
      {
        'title': '账单',
        'render': Bill(),
        'index': 1,
        'icon': Icon(Icons.date_range)
      },
      {
        'title': '我的',
        'render': Text('我的'),
        'index': 2,
        'icon': Icon(Icons.face)
      }
    ];

    return Container(
        // 设置容器颜色
        decoration: BoxDecoration(color: Colors.white),
        child: Scaffold(
            key: Key('scaffold'),
            // app bar 头部导航栏
            appBar: AppBar(
              toolbarHeight: 50,
              title: Text(tableList[_currentIndex]['title']),
            ),
            drawer: MyDrawer(),
            // 底部导航栏
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                mouseCursor: MouseCursor.defer,
                onTap: (int item) {
                  setState(() {
                    _currentIndex = item;
                  });
                },
                items: tableList.map((e) {
                  return BottomNavigationBarItem(
                    icon: e['icon'],
                    label: e['title'],
                  );
                }).toList()),
            // 展示浮动的按钮
            floatingActionButton: floatButtonList[_currentIndex],
            // 实现tab栏切换效果
            body: Stack(
              children: tableList.map((e) {
                return Offstage(
                  offstage: _currentIndex != e['index'],
                  child: e['render'],
                );
              }).toList(),
            )));
  }
}

void main() {
  runApp(MaterialApp(
      title: 'my app',
      home: MyApp(),
      routes: routes,
      theme: themeConfig(Colors.pink[300])));
}
