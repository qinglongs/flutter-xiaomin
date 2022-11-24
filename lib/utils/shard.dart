import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgUtils {
  static String svgPath(String svgName) {
    return "assets/svg/$svgName";
  }

  static SvgPicture svg(String svgName, {double}) {
    var name = svgName;
    if (name.endsWith(".svg") == false) {
      name = "$svgName.svg";
    }
    return SvgPicture.asset(SvgUtils.svgPath(name));
  }
}

/// 设置 appbar 样式
setAppbar({final Color? backgroundColor}) {
  // 主题配置
  SystemUiOverlayStyle uiStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: const Color(0x00000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark);

  SystemChrome.setSystemUIOverlayStyle(uiStyle);
}

