import 'package:flutter/material.dart';
import '../../components/app-bar/app-bar.dart';

class AddLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: '记事本'),
      body: Center(
        child: Text(
          '记事本',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
