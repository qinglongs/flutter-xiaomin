import 'dart:ui';

import 'package:flutter/services.dart';

class Sys {
  /// 设置 appbar 样式
  setAppbar({
    Brightness theme = Brightness.light,
  }) {
    // 主题配置
    SystemUiOverlayStyle uiStyle = SystemUiOverlayStyle(
        systemNavigationBarColor: const Color(0x00000000),
        systemNavigationBarDividerColor: null,
        systemNavigationBarIconBrightness: theme,
        statusBarIconBrightness: theme,
        statusBarBrightness: theme);



    SystemChrome.setSystemUIOverlayStyle(uiStyle);
  }

}