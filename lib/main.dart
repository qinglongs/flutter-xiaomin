import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import './components/open-camera/open-camera.dart';
import './home-ui/log-list/log-list.dart';
import './pages/log-page/log-page.dart';
import './pages/add-log/add-log.dart';

import './utils/theme-config.dart';

const List<String> title = ['记事本', '日记', '我的'];

var routes = {
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
  // 底部tab点击索引
  int _currentIndex = 0;

  // 点击+号按钮
  onPressAdd() {
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
    // myRouter.push(context: context, url: 'add-log');
  }

  @override
  build(BuildContext context) {
    return Container(
        // 设置容器颜色
        decoration: BoxDecoration(color: Colors.white),
        child: Scaffold(
            key: Key('scaffold'),
            // app bar 头部导航栏
            appBar: AppBar(
              toolbarHeight: 50,
              title: Text(title[_currentIndex]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              mouseCursor: MouseCursor.defer,
              onTap: (int item) {
                setState(() {
                  _currentIndex = item;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '记事本',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.date_range),
                  label: '日记',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.face),
                  label: '我的',
                ),
              ],
            ),
            floatingActionButton: _currentIndex == 0
                ? FloatingActionButton(
                    child: GestureDetector(
                      onLongPress: _onLongPressAdd,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                    onPressed: onPressAdd)
                : null,
            // 实现tab栏切换效果
            body: Stack(
              children: [
                Offstage(
                    offstage: _currentIndex != 0, //这里控制
                    child: ListState(key: childKey)),
                Offstage(
                  offstage: _currentIndex != 1, //这里控制
                  child: Text('日记'),
                ),
                Offstage(
                  offstage: _currentIndex != 2, //这里控制
                  child: Text('我的'),
                ),
              ],
            )));
  }
}

void main() {
  runApp(MaterialApp(
      title: 'my app',
      home: MyApp(),
      routes: routes,
      theme: themeConfig(Colors.black,
          scaffoldBackgroundColor: Colors.black,
          body: TextStyle(
            color: Colors.white,
          ),
          subTitle: TextStyle(
            color: Colors.white,
          ),
          headline: TextStyle(
            color: Colors.white,
          ),
          button: TextStyle(color: Colors.white))));
}
