import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.child, this.onPressed})
      : super(key: key);

  /// 点击
  final void Function()? onPressed;

  /// 子元素
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        // padding: MaterialStateProperty.all(buttonStyle?.padding),
        backgroundColor: MaterialStateProperty.resolveWith(
            (states) => const Color.fromRGBO(253, 126, 126, 1)),

        /// 文字和 icon 颜色
        foregroundColor: MaterialStateProperty.all(Colors.white),

        /// 圆角
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

        /// 边框
        // side: MaterialStateProperty.all(
        //   buttonStyle?.borderSide,
        // ),
      ),
    );
  }
}
