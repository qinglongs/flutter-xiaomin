import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({Key? key, this.suffixIcon, this.hitText = '请输入', this.margin})
      : super(key: key);

  /// 右侧icon
  final Widget? suffixIcon;

  /// 占位文字
  final String? hitText;

  /// 外边距
  final EdgeInsetsGeometry? margin;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputState();
  }
}

class InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: widget.margin,
      child: TextField(
        decoration: InputDecoration(
          suffixIconColor: const Color.fromRGBO(253, 126, 126, 1),
          suffixIcon: widget.suffixIcon,
          hintStyle: const TextStyle(
              fontSize: 14, color: Color.fromRGBO(191, 191, 191, 1)),
          hintText: widget.hitText,
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1))),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1))),
          focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(217, 217, 217, 1), width: 1),
          ),
        ),
      ),
    );
  }
}
