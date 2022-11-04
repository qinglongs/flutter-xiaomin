import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  const Tag({Key? key, required this.text, this.active, this.icon})
      : super(key: key);

  /// tag 文字
  final String text;

  /// 是否选中
  final bool? active;

  /// icon
  final IconData? icon;

  @override
  State<StatefulWidget> createState() {
    return TagState();
  }
}

class TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.icon != null
        ? Colors.black
        : widget?.active == true
            ? const Color.fromRGBO(253, 126, 126, 1)
            : const Color.fromRGBO(191, 191, 191, 1);


    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 16),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: widget?.active == true
              ? const Color.fromRGBO(253, 126, 126, 0.1)
              : const Color.fromRGBO(231, 231, 231, 0.3),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Row(
        children: [
          Text(
            widget.text,
            style: TextStyle(fontSize: 14, color: textColor),
          ),
          widget.icon != null
              ? Icon(widget.icon,color: const Color.fromRGBO(191, 191, 191, 1),)
              : const SizedBox(
                  width: 0,
                  height: 0,
                )
        ],
      ),
    );
  }
}
