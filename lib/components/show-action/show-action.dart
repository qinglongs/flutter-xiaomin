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

  void showConfirm(BuildContext context,
      {String okText = '确认',
      String cancelText = '取消',
      Function onConfrim,
      String title = '提示',
      String content}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            titleTextStyle: TextStyle(color: Colors.black),
            content: Text(content),
            actions: [
              FlatButton(onPressed: onConfrim, child: Text(okText)),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(cancelText))
            ],
          );
        });
  }
}

final actionSheet = ActionSheet();
