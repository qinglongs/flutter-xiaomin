import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './pages/log-page/log-page.dart';
import './pages/add-log/add-log.dart';

import './router.dart';

const String img =
    'https://owenkenny.com/wp-content/uploads/2017/09/OKP-empathy-icon.png';

const List<String> title = ['主页', '日记', '我的'];

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

  List<dynamic> _list = [1, 2, 3, 4, 5, 6, 7, 8];

  Future<void> _onRefresh() {
    return Future(() {
      final temp = _list;
      temp.add(_list[_list.length - 1] + 1);
      setState(() {
        _list = temp;
      });
    });
  }

  _onTap(String e) {
    return () => // 路由跳转

        MyRouter().push(context: context, url: 'log-page', params: e);
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
              // actions 好像暂时没什么用
              // actions: <Widget>[
              //   GestureDetector(
              //     onTap: () {
              //       setState(() {
              //         _isClick = !_isClick;
              //       });
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.only(right: 20),
              //       child: Icon(
              //         Icons.favorite,
              //         color: _isClick ? Pink : Colors.white,
              //       ),
              //     ),
              //   ),
              // ],
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
                child: Icon(Icons.add, color: Colors.white),
                backgroundColor: pink,
                onPressed: () {
                  MyRouter().push(context: context, url: 'add-log');
                }),
            body: Stack(
              children: [
                new Offstage(
                    offstage: _currentIndex != 0, //这里控制
                    child: RefreshIndicator(
                      backgroundColor: pink,
                      onRefresh: _onRefresh,
                      child: ListView(
                          children: _list
                              .map((e) => ListTile(
                                    onTap: _onTap('第$e件事....'),
                                    title: Text('第$e件事....'),
                                    subtitle: Text('2020年11月27日16点47分'),
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(img),
                                    ),
                                  ))
                              .toList() as List<Widget>),
                    )),
                new Offstage(
                  offstage: _currentIndex != 1, //这里控制
                  child: Text('日记'),
                ),
                new Offstage(
                  offstage: _currentIndex != 2, //这里控制
                  child: Text('我的'),
                ),
              ],
            )));
  }
}

// 弹窗提示
void showDialogModal(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: pink,
          semanticLabel: '不知道这是啥',
          title: Text(
            '这是一个提示',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          children: <Widget>[
            SimpleDialogOption(
              child: Text(
                '这是提示描述内容',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      });
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
