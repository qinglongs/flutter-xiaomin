import 'package:flutter/cupertino.dart';
import 'package:flutter_xiaomin/pages/record/calendar/calendar.dart';

class Record extends StatelessWidget {
  const Record({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const SingleChildScrollView(
      child: Calendar(),
    );
  }
}