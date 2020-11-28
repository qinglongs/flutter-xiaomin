import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../components/app-bar/app-bar.dart';
import '../../components/open-camera/open-camera.dart';

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
    images.add(image);
  }

  onPressAddImage() {
    openMyCamera.tapPickImage(context, (PickedFile image) {
      setState(() {
        images.add(image);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: '记事本'),
      body: Container(
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
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 100,
                    width: 100,
                    child: Image.file(File(item.path)),
                  );
                }).toList(),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onPressAddImage,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
