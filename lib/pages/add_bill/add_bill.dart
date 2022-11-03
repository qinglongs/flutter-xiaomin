import 'package:flutter/cupertino.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';

class AddBill extends StatefulWidget {
  const AddBill({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddBillState();
  }
}

class AddBillState extends State<AddBill> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const ScreenScaffold(
      title: '新增账单',
      body: Center(
        child: Text('新增账单'),
      ),
    );
  }
}
