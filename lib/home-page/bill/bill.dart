import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/bill-item/bill-item.dart';

class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.start,
        children: [
          BillItem(),
          BillItem(),
          BillItem(),
        ],
      ),
    );
  }
}
