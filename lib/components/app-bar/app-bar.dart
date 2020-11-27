import 'package:flutter/material.dart';

Widget appBar(BuildContext context, {String title}) {
  return AppBar(
    toolbarHeight: 50,
    title: Text(title),
    // actions: <Widget>[
    //   Padding(
    //     padding: const EdgeInsets.only(right: 20),
    //     child: Icon(Icons.favorite),
    //   ),
    // ],
    backgroundColor: Colors.pink[300],
  );
}
