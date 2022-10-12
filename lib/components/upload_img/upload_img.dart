import 'package:flutter/material.dart';
import "package:file_picker/file_picker.dart";

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  UploadImageState createState() {
    return UploadImageState();
  }
}

class UploadImageState extends State<UploadImage> {
  /// 文件列表
  final List<FilePickerResult> imageList = [];

  /// 获取选中文件
  List<FilePickerResult> getResult() {
    return imageList;
  }

  /// 点击选择文件
  Future<void> _handleTap() async {
    FilePickerResult? res = await FilePicker.platform.pickFiles();
    if (res != null) {
      setState(() {
        imageList.add(res);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...imageList.map((item) {
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 100,
              height: 100,
              child: Image.network('https://himg.bdimg.com/sys/portrait/item/wise.1.f7d5aac9.bO5RnVW18GMydUPTLecnuw.jpg?time=11563&tieba_portrait_time=11563',width: 100,height: 100,fit: BoxFit.cover,),
            ),
          );
        }).toList(),
        GestureDetector(
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
      ],
    );
  }
}
