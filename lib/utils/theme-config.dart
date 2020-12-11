import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

ThemeData themeConfig(Color themeColor,
    {Color scaffoldBackgroundColor = Colors.white,
    TextStyle body = const TextStyle(color: Colors.black),
    TextStyle subTitle = const TextStyle(color: Colors.black),
    TextStyle headline = const TextStyle(color: Colors.black),
    TextStyle button = const TextStyle(color: Colors.black)}) {
  return ThemeData(
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryColor: themeColor,
      primaryColorBrightness: Brightness.dark,
      primaryColorDark: themeColor,
      primaryColorLight: themeColor,
      backgroundColor: themeColor,
      iconTheme: IconThemeData(color: themeColor),
      buttonColor: themeColor,
      buttonTheme: ButtonThemeData(buttonColor: themeColor),
      appBarTheme: AppBarTheme(color: themeColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: themeColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400]),
      textTheme: TextTheme(
        bodyText1: body,
        bodyText2: body,
        subtitle1: subTitle,
        subtitle2: subTitle,
        headline1: headline,
        headline2: headline,
        headline3: headline,
        headline4: headline,
        headline5: headline,
        headline6: headline,
        button: button,
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: themeColor));
}
