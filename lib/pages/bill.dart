import 'package:flutter/cupertino.dart';

class Bill extends StatelessWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Text(
       '账单',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}