import 'package:flutter/material.dart';
import '../../components/app-bar/app-bar.dart';

class AddBill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: '新增账单', action: []),
      body: Container(
        child: Text('新增账单'),
      ),
    );
  }
}
