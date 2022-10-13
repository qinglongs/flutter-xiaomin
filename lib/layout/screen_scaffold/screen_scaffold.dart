import 'package:flutter/material.dart';

class ScreenScaffold extends StatelessWidget {
  final Widget? body;
  final String? title;
  final List<Widget>? actions;

  const ScreenScaffold({Key? key, this.body, this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: title != null
          ? AppBar(
              centerTitle: true,
              title: Text(
                title!,
                style: const TextStyle(fontSize: 16),
              ),
              actions: actions,
            )
          : null,
      body: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(247, 249, 252, 1),
              Color.fromRGBO(255, 242, 242, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          width: size.width,
          height: size.height,
          child: body),
    );
  }
}
