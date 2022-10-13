import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

class Tag extends StatefulWidget {
  final bool? closeable;
  final String text;

  const Tag(this.text, {Key? key, this.closeable = false}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return TagState();
  }
}

class TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(253, 126, 126, 0.1),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Center(
              child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child:  Text(
                  widget.text,
                  style: const TextStyle(color: Color.fromRGBO(253, 126, 126, 1)),
                ),
              ),
              widget.closeable == true ? SvgUtils.svg('close') : Container(),
            ],
          )),
        )
      ],
    );
  }
}
