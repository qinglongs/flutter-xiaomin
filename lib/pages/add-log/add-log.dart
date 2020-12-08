import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../components/app-bar/app-bar.dart';
import '../../components/open-camera/open-camera.dart';
import '../../components/show-action/show-action.dart';

class AddLogState extends StatefulWidget {
  final PickedFile image;

  AddLogState({this.image});

  @override
  State<StatefulWidget> createState() {
    return AddLog(image: image);
  }
}

class AddLog extends State<AddLogState> {
  List<PickedFile> images = [];

  AddLog({PickedFile image}) {
    if (image == null) return;
    images.add(image);
  }

  onPressAddImage() {
    openMyCamera.tapPickImage(context, (PickedFile image) {
      setState(() {
        images.add(image);
      });
    });
  }

  // 点击展示图片
  _onTapShowImage(PickedFile image) {
    return () => actionSheet.showModal(context,
        showContent: Image.file(File(image.path)));
  }

  // 点击删除图片
  _onTapDeleteImage(PickedFile image) {
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: '记事本'),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: '这一刻的想法...',
                  )),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: images.map((item) {
                  return GestureDetector(
                    onTap: _onTapShowImage(item),
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              // 给container添加背景图片
                              image: AssetImage(item.path),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: _onTapDeleteImage(item),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: Colors.pink,
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Row(
                children: images.length < 3
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
