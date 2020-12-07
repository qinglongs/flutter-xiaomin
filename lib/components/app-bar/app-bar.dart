import 'package:flutter/material.dart';

Widget appBar(BuildContext context, {String title, List<Widget> action}) {
  return AppBar(
    toolbarHeight: 50,
    title: Text(title),
    actions: action,
    backgroundColor: Colors.pink[300],
  );
}
