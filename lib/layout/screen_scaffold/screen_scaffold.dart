import 'package:flutter/material.dart';

import 'dart:ui';

class AppbarOption {
  AppbarOption(
      {this.title, this.backgroundColor, this.iconColor, this.titleColor});

  late String? title;
  late Color? titleColor;
  late Color? backgroundColor;
  late Color? iconColor;
}

class ScreenScaffold extends StatelessWidget {
  final Widget? body;
  final String? title;
  final List<Widget>? actions;
  final EdgeInsets? bodyPadding;
  final AppbarOption? appbarOption;

  const ScreenScaffold(
      {Key? key,
      this.body,
      this.title,
      this.actions,
      this.bodyPadding,
      this.appbarOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: title != null
          ? AppBar(
              shadowColor: Colors.transparent,
              backgroundColor:
                  appbarOption?.backgroundColor ?? Colors.transparent,
              centerTitle: true,
              title: Text(
                title!,
                style: TextStyle(fontSize: 16, color: appbarOption?.titleColor),
              ),
              actions: actions,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: appbarOption?.iconColor,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            )
          : null,
      body: Container(
          constraints:
              BoxConstraints(maxHeight: size.height, maxWidth: size.width),
          /// 兼容状态栏高度
          margin: title == null
              ? EdgeInsets.only(
                  top: MediaQueryData.fromWindow(window).padding.top)
              : null,
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
          child: body),
    );
  }
}
