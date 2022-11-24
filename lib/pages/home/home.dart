import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

import '../bill/bill.dart';
import '../notepad/notepad.dart';
import '../record/record.dart';
import '../target/target.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  static final List<Widget> _bottomNavigationBarOptions = <Widget>[
    Notepad(),
    const Record(),
    const Bill(),
    const Target(),
  ];

  /// 新增事件
  _handleTapAddNote() {
    Navigator.pushNamed(context, 'addNote');
  }

  /// 新增账单
  _handleTapAddBill() {
    Navigator.pushNamed(context, 'addBill');
  }

  /// 新建目标
  _handleTapAddTarget() {
    Navigator.pushNamed(context, 'chooseTarget');
  }

  /// 渲染右下角的固定按钮
  _renderFloatingActionButton() {
    /// 点击事件map
    Map<int, void Function()> tapMap = {
      0: _handleTapAddNote,
      2: _handleTapAddBill,
      3: _handleTapAddTarget,
    };
    if (tapMap[_currentIndex] != null) {
      return FloatingActionButton(
        backgroundColor: const Color.fromRGBO(253, 126, 126, 1),
        onPressed: tapMap[_currentIndex],
        child: const Icon(Icons.add),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var marginTop =
        EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      floatingActionButton: _renderFloatingActionButton(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgUtils.svg('note-pad'),
            label: '记事本',
          ),
          BottomNavigationBarItem(
            icon: SvgUtils.svg('record'),
            label: '经期记录',
          ),
          BottomNavigationBarItem(
            icon: SvgUtils.svg('bill'),
            label: '账单',
          ),
          BottomNavigationBarItem(
            icon: SvgUtils.svg('target'),
            label: '目标',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromRGBO(253, 126, 126, 1),
        unselectedItemColor: const Color.fromRGBO(127, 124, 124, 1),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Container(
        margin: [1, 3].contains(_currentIndex) ? marginTop : null,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromRGBO(247, 249, 252, 1),
            Color.fromRGBO(255, 242, 242, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        width: 1000,
        height: 1000,
        child: _bottomNavigationBarOptions.elementAt(_currentIndex),
      ),
    );
  }
}
