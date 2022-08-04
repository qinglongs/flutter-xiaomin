import 'package:flutter/cupertino.dart';

class Record extends StatelessWidget {
  const Record({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Text(
      '记录',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}