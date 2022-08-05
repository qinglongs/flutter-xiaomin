import 'package:flutter_svg/flutter_svg.dart';

//
class SvgUtils {
  static String svgPath(String svgName) {
    return "svg/$svgName";
  }

  static SvgPicture svg(String svgName, { double}) {
    var name = svgName;
    if (name.endsWith(".svg") == false) {
      name = "$svgName.svg";
    }
    return SvgPicture.asset(SvgUtils.svgPath(name));
  }
}