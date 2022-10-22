import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Skip extends StatefulWidget {
  final void Function() handleSkip;

  const Skip({Key? key, required this.handleSkip}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SkipState();
  }
}

class SkipState extends State<Skip> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: widget.handleSkip,
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: const Color.fromRGBO(253, 126, 126, 0.5), width: 1),
        ),
        child: const Text(
          '跳过3s',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
