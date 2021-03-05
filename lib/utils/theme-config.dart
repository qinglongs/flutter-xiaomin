import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

ThemeData themeConfig(
  Color themeColor,
) {
  return ThemeData(
      primaryColor: themeColor,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: themeColor),
      tabBarTheme: TabBarTheme(labelColor: themeColor));
}
