import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: const Text('添加事件'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.more_vert,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ],
    ));
  }
}
