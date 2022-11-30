import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

class Tag extends StatefulWidget {
  const Tag(this.text,
      {Key? key,
      this.closeable = false,
      this.backgroundColor,
      this.onTap,
      this.color,
      this.margin})
      : super(key: key);

  final bool? closeable;
  final String text;
  final Color? backgroundColor;
  final Color? color;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  State<StatefulWidget> createState() {
    return TagState();
  }
}

class TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    /// 背景颜色
    Color backgroundColor =
        widget.backgroundColor ?? const Color.fromRGBO(253, 126, 126, 0.1);

    Color color = widget.color ?? const Color.fromRGBO(253, 126, 126, 1);

    Widget icon = widget.closeable == true
        ? SvgUtils.svg('close')
        : const SizedBox(width: 0, height: 0);

    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Container(
            margin: widget.margin,
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ),
                icon
              ],
            )),
          )
        ],
      ),
    );
  }
}
