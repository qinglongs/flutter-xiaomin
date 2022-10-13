import 'dart:io';

import 'package:flutter/material.dart';
import "package:file_picker/file_picker.dart";

class ChooseFile extends StatefulWidget {
  int? maxSize;

  String? fileType;

  ChooseFile({Key? key, this.maxSize = 3, this.fileType = 'image'})
      : super(key: key);

  @override
  ChooseFileState createState() {
    return ChooseFileState();
  }
}

class ChooseFileState extends State<ChooseFile> {
  /// 文件列表
  final List<FilePickerResult> fileList = [];

  /// 获取选中文件
  List<FilePickerResult> getResult() {
    return fileList;
  }

  /// 点击选择文件
  Future<void> _handleTap() async {
    FilePickerResult? res = await FilePicker.platform.pickFiles();
    if (res != null) {
      setState(() {
        fileList.add(res);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...fileList.map((item) {
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 100,
              height: 100,
              child: Image.file(
                File(item.files.first.path!),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
        fileList.length < widget.maxSize!
            ? GestureDetector(
                onTap: _handleTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: const Color.fromRGBO(196, 196, 196, 0.2),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Color.fromRGBO(127, 124, 124, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
