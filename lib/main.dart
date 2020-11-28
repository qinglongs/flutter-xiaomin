import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './router.dart';
import 'package:image_picker/image_picker.dart';
import './components/open-camera/open-camera.dart';

const String img =
    'https://owenkenny.com/wp-content/uploads/2017/09/OKP-empathy-icon.png';

const List<String> title = ['记事本', '日记', '我的'];

// 主题色
final pink = Colors.pink[300];

class MyStatefuWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }
}

class MyApp extends State<MyStatefuWidget> {
  // 底部tab点击索引
  int _currentIndex = 0;

  // 点击右上角小红心
  // bool _isClick = false;

  // 记事本列表原始数据
  List<int> _list = [1, 2, 3, 4, 5, 6, 7, 8];

  Future<void> _onRefresh() {
    return Future(() {
      final temp = _list;
      temp.add(_list[_list.length - 1] + 1);
      setState(() {
        _list = temp;
      });
    });
  }

  // 点击记事本列表的某个元素
  _onTapListItem(String e) {
    return () => // 路由跳转
        myRouter.push(context: context, url: 'log-page', params: e);
  }

  // 点击+号按钮
  onPressAdd() {
    openMyCamera.tapPickImage(context, (PickedFile iamge) {
      myRouter.push(context: context, url: 'add-log', params: iamge);
    });
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
              backgroundColor: pink,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              mouseCursor: MouseCursor.defer,
              selectedItemColor: pink,
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
            floatingActionButton: FloatingActionButton(
                child: GestureDetector(
                  onLongPress: () {
                    myRouter.push(context: context, url: 'add-log');
                  },
                  child: Icon(Icons.add, color: Colors.white),
                ),
                backgroundColor: pink,
                onPressed: onPressAdd),
            // 实现tab栏切换效果
            body: Stack(
              children: [
                Offstage(
                    offstage: _currentIndex != 0, //这里控制
                    child: RefreshIndicator(
                      backgroundColor: pink,
                      onRefresh: _onRefresh,
                      child: ListView(
                          children: _list
                              .map((e) => ListTile(
                                    onTap: _onTapListItem('第$e件事....'),
                                    title: Text('第$e件事....'),
                                    subtitle: Text('2020年11月27日16点47分'),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(img),
                                    ),
                                  ))
                              .toList() as List<Widget>),
                    )),
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
    home: MyStatefuWidget(),
    theme: ThemeData(
        backgroundColor: Colors.white,
        accentColor: Colors.white,
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          title: TextStyle(color: Colors.white),
        )),
  ));
}
