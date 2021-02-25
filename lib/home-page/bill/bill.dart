import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 100,
            color: Colors.pinkAccent[100],
            child: Text('账单'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
