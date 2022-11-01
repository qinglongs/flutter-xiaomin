import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CalendarLabel extends StatelessWidget {
  const CalendarLabel({Key? key, required this.title, this.color})
      : super(key: key);

  final String title;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            color: Colors.pink,
            width: 10,
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: color ?? const Color.fromRGBO(196, 196, 196, 1)),
          )
        ],
      ),
      margin: const EdgeInsets.only(right: 16),
    );
  }
}
