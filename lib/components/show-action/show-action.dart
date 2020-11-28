import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionSheet {
  // 展示动作面板
  void showAction(BuildContext context, {List<Widget> showContent}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: showContent,
          );
        });
  }

  // 展示弹窗
  void showModal(BuildContext context, {Widget showContent}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return showContent;
        });
  }
}

final actionSheet = ActionSheet();
