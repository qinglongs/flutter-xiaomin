import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

class Tag extends StatefulWidget {
  const Tag({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TagState();
  }
}

class TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                margin: EdgeInsets.only(right: 5),
                child: const Text(
                  '日记',
                  style: TextStyle(color: Color.fromRGBO(253, 126, 126, 1)),
                ),
              ),
              SvgUtils.svg('close')
            ],
          )),
        )
      ],
    );
  }
}
