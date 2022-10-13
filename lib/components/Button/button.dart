import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // TODO: implement build
    return OutlinedButton(
      onPressed: () {
        debugPrint('Received click');
      },
      child: const SizedBox(
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text('保存'),
        ),
      ),
    );
  }
}
