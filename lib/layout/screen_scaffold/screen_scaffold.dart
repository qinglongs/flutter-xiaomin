import 'package:flutter/material.dart';

import 'dart:ui';

class ScreenScaffold extends StatelessWidget {
  final Widget? body;
  final String? title;
  final List<Widget>? actions;
  final EdgeInsets? bodyPadding;

  const ScreenScaffold(
      {Key? key, this.body, this.title, this.actions, this.bodyPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: title != null
          ? AppBar(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                title!,
                style: const TextStyle(fontSize: 16),
              ),
              actions: actions,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
            )
          : null,
      body: Container(
          /// 兼容状态栏高度
          margin: EdgeInsets.only(
              top: MediaQueryData.fromWindow(window).padding.top),
          padding: bodyPadding ??
              const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(247, 249, 252, 1),
              Color.fromRGBO(254, 242, 242, 1.0),
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
