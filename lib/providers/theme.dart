import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class GlobalTheme with ChangeNotifier, DiagnosticableTreeMixin {
  /// 主题色10
  final Color _themeColor10 = const Color.fromRGBO(253, 126, 126, .1);

  /// 主题色20
  final Color _themeColor20 = const Color.fromRGBO(253, 126, 126, .2);

  /// 主题色30
  final Color _themeColor30 = const Color.fromRGBO(253, 126, 126, .3);

  /// 主题色40
  final Color _themeColor40 = const Color.fromRGBO(253, 126, 126, .4);

  /// 主题色50
  final Color _themeColor50 = const Color.fromRGBO(253, 126, 126, .5);

  /// 主题色60
  final Color _themeColor60 = const Color.fromRGBO(253, 126, 126, .6);

  /// 主题色70
  final Color _themeColor70 = const Color.fromRGBO(253, 126, 126, .7);

  /// 主题色80
  final Color _themeColor80 = const Color.fromRGBO(253, 126, 126, .8);

  /// 主题色90
  final Color _themeColor90 = const Color.fromRGBO(253, 126, 126, .9);

  /// 主题色
  final Color _themeColor = const Color.fromRGBO(253, 126, 126, 1);

  /// 基础字体颜色
  final Color _baseFontColor = const Color.fromRGBO(0, 0, 0, 1);

  /// 按钮颜色
  final Color _defaultButtonColor = const Color.fromRGBO(253, 126, 126, 1);

  /// 获取主题色
  Color get themeColor => _themeColor;

  /// 获取主题色10
  Color get themeColor10 => _themeColor10;

  /// 获取主题色20
  Color get themeColor20 => _themeColor20;

  /// 获取主题色30
  Color get themeColor30 => _themeColor30;

  /// 获取主题色40
  Color get themeColor40 => _themeColor40;

  /// 获取主题色50
  Color get themeColor50 => _themeColor50;

  /// 获取主题色60
  Color get themeColor60 => _themeColor60;

  /// 获取主题色70
  Color get themeColor70 => _themeColor70;

  /// 获取主题色80
  Color get themeColor80 => _themeColor80;

  /// 获取主题色90
  Color get themeColor90 => _themeColor90;

  /// 基础字体颜色
  Color get baseFontColor => _baseFontColor;

  /// 获取默认按钮颜色
  Color get defaultButtonColor => _defaultButtonColor;

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('themeColor', themeColor));
    properties.add(ColorProperty('themeColor10', themeColor10));
    properties.add(ColorProperty('themeColor20', themeColor20));
    properties.add(ColorProperty('themeColor30', themeColor30));
    properties.add(ColorProperty('themeColor40', themeColor40));
    properties.add(ColorProperty('themeColor50', themeColor50));
    properties.add(ColorProperty('themeColor60', themeColor60));
    properties.add(ColorProperty('themeColor70', themeColor70));
    properties.add(ColorProperty('themeColor80', themeColor80));
    properties.add(ColorProperty('themeColor90', themeColor90));
    properties.add(ColorProperty('baseFontColor', baseFontColor));
    properties.add(ColorProperty('defaultButtonColor', defaultButtonColor));
  }
}
