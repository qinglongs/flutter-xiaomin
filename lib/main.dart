import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xiaomin/pages/note_detail/note_detail.dart';
import 'package:flutter_xiaomin/pages/preview_file/preview_file.dart';
import 'package:flutter_xiaomin/pages/user_info/user_info.dart';

import 'pages/notepad/notepad.dart';
import 'pages/record/record.dart';
import 'pages/bill/bill.dart';
import 'pages/target/target.dart';
import 'pages/add_note/add_note.dart';
import 'pages/note_detail/note_detail.dart';

void main() {
  runApp(const MyApp());

  // 主题配置
  SystemUiOverlayStyle uiStyle = const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0x00000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light);

  SystemChrome.setSystemUIOverlayStyle(uiStyle);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登录',
      routes: {
        'addNote': (context) => const AddNote(),
        'previewFile': (context) => const PreviewFile(),
        'userInfo': (context) => const UserInfo(),
        'noteDetail': (context) => const NoteDetail()
      },
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          /// 线框按钮主题配置
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              /// 圆角
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),

              /// 边框
              side: MaterialStateProperty.all(
                const BorderSide(
                    color: Color.fromRGBO(253, 126, 126, 1), width: 0),
              ),

              /// 背景
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => const Color.fromRGBO(253, 126, 126, 1)),

              /// 文字和 icon 颜色
              foregroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => const Color.fromRGBO(253, 126, 126, 1)),

            /// 文字和 icon 颜色
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),

            /// 圆角
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
          )),

          /// 状态栏主题
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color.fromRGBO(38, 38, 38, 1)),
              titleTextStyle: TextStyle(color: Color.fromRGBO(38, 38, 38, 1)))),
      home: const MyHomePage(title: 'hello world'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '记事本',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '记录',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '账单',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '目标',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromRGBO(253, 126, 126, 1),
        unselectedItemColor: const Color.fromRGBO(127, 124, 124, 1),
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Container(
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
