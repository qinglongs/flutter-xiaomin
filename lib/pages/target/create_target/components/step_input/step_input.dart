import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../button_icon/button_icon.dart';

class StepInput extends StatefulWidget {
  const StepInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StepInputState();
  }
}

class StepInputState extends State<StepInput> {
  int count = 0;

  _onTapAdd() {
    setState(() {
      count++;
    });
  }

  _onTapRemove() {
    if (count <= 0) return;
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        ButtonIcon(
          onTap: _onTapRemove,
          icon: Icons.remove,
        ),
        Container(
          margin: const EdgeInsets.only(left: 9, right: 9),
          constraints:
              const BoxConstraints(minWidth: 31, maxHeight: 31, minHeight: 31),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(253, 126, 126, 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Center(
            child: Text(
              '$count',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        ButtonIcon(
          onTap: _onTapAdd,
          icon: Icons.add,
        ),
      ],
    );
  }
}
