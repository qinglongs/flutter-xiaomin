import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../components/app-bar/app-bar.dart';
import '../../components/open-camera/open-camera.dart';
import '../../components/show-action/show-action.dart';
import '../../service/log.dart';

import 'package:uuid/uuid.dart';

class AddLogState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddLog();
  }
}

var temp = [];

class AddLog extends State<AddLogState> {
  List<Map> _images = [];

  bool _isFrist = true;

  String _textValue = '';

  onPressAddImage() {
    openMyCamera.tapPickImage(context, (PickedFile image) {
      setState(() {
        _images.add({'key': Uuid().hashCode, 'image': image});
      });
    });
  }

  // 点击展示图片
  _onTapShowImage(Map item) {
    return () => actionSheet.showModal(context,
        showContent: Image.file(File(item['image'].path)));
  }

  // 点击删除图片
  _onTapDeleteImage(int index) {
    return () {
      print(index);
      setState(() {
        _images.removeAt(index);
      });
    };
  }

  // 文本change事件
  _onChangeTextField(String v) {
    setState(() {
      _textValue = v;
    });
  }

  // 点击发送
  _onPressedSend(context) {
    // 获取到数据
    return () async {
      if (_textValue.length == 0) {
        return actionSheet.showToast(msg: '你都没想说的话，我很难为你做事啊');
      }

      if (_images.length == 0) {
        return actionSheet.showToast(msg: '图片都没有，我一样很难为你做事');
      }

      await postAddLog(
          {'content': _textValue, 'image': _images[0]['image'].path});

      actionSheet.showToast(msg: '发布成功啦！');

      Navigator.pop<String>(context, 'xxx');
    };
  }

  @override
  Widget build(BuildContext context) {
    // 接收路由参数
    PickedFile file = ModalRoute.of(context).settings.arguments;

    // 只有第一次进入才会添加照片
    if (file != null && _isFrist) {
      setState(() {
        _isFrist = false;
        _images.add({'key': Uuid().hashCode, 'image': file});
      });
    }
    return Scaffold(
      appBar: appBar(context, title: '记事本', action: [
        IconButton(
            icon: Icon(Icons.forward_to_inbox),
            onPressed: _onPressedSend(context))
      ]),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextField(
                  onChanged: _onChangeTextField,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: '这一刻的想法...',
                  )),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _images
                    .asMap()
                    .map((i, item) {
                      return MapEntry(
                          i,
                          Row(
                            children: [
                              GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: _onTapShowImage(item),
                                  onLongPress: _onTapDeleteImage(i),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                        child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        item['image'].path,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                  )),
                              SizedBox(width: 10),
                            ],
                          ));
                    })
                    .values
                    .toList(),
              ),
              Row(
                children: _images.length < 3
                    ? [
                        GestureDetector(
                          onTap: onPressAddImage,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ]
                    : [],
              )
            ])
          ],
        ),
      ),
    );
  }
}
