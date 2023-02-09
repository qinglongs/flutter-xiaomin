import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/pages/bill/add_bill/add_bill.dart';
import 'package:flutter_xiaomin/pages/target/choose_target/choose_target.dart';
import 'package:flutter_xiaomin/pages/target/create_target/create_target.dart';
import 'package:flutter_xiaomin/pages/forget_password/forget_password.dart';
import 'package:flutter_xiaomin/pages/home/home.dart';
import 'package:flutter_xiaomin/pages/login/login-page.dart';
import 'package:flutter_xiaomin/pages/notepad/note_detail/note_detail.dart';
import 'package:flutter_xiaomin/pages/notepad/note_drafts/note_drafts.dart';
import 'package:flutter_xiaomin/pages/preview_file/preview_file.dart';
import 'package:flutter_xiaomin/pages/register/register.dart';
import 'package:flutter_xiaomin/pages/splash_screen/splash_screen.dart';
import 'package:flutter_xiaomin/pages/user_info/user_info.dart';
import 'package:flutter_xiaomin/providers/theme.dart';
import 'package:provider/provider.dart';

import 'pages/notepad/add_note/add_note.dart';
import 'pages/notepad/note_detail/note_detail.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalTheme()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeOptions = context.read<GlobalTheme>();

    return MaterialApp(
      initialRoute: 'login',
      routes: {
        'splashScreen': (context) => const SplashScreen(),
        'login': (context) => const Login(),
        'addNote': (context) => const AddNote(),
        'previewFile': (context) => const PreviewFile(),
        'userInfo': (context) => const UserInfo(),
        'noteDetail': (context) => const NoteDetail(),
        'noteDrafts': (context) => const NoteDrafts(),
        'forgetPassword': (context) => const ForgetPassword(),
        'register': (context) => const Register(),
        'home': (context) => const MyHomePage(),
        'addBill': (context) => const AddBill(),
        'createTarget': (context) => const CreateTarget(),
        'chooseTarget': (context) => const ChooseTarget()
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
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              /// 圆角
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),

              /// 边框
              side: MaterialStateProperty.all(
                BorderSide(color: themeOptions.themeColor, width: 0),
              ),

              /// 背景
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => themeOptions.themeColor),

              /// 文字和 icon 颜色
              foregroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
            ),
          ),

          /// 状态栏主题
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color.fromRGBO(38, 38, 38, 1)),
              titleTextStyle: TextStyle(color: Color.fromRGBO(38, 38, 38, 1)))),
      home: const SplashScreen(),
    );
  }
}
