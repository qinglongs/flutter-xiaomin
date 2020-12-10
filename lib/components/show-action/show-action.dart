import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  void showToast({String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[500],
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

final actionSheet = ActionSheet();
