import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import "package:file_picker/file_picker.dart";
import 'package:video_thumbnail/video_thumbnail.dart';

class ChooseFile extends StatefulWidget {
  final int? maxSize;

  final String? fileType;

  const ChooseFile({Key? key, this.maxSize = 3, this.fileType = 'image'})
      : super(key: key);

  @override
  ChooseFileState createState() {
    return ChooseFileState();
  }
}

class ChooseFileState extends State<ChooseFile> {
  /// 文件列表
  final List<FilePickerResult> fileList = [];

  final List<Uint8List> videoList = [];

  /// 获取选中文件
  List<FilePickerResult> getResult() {
    return fileList;
  }

  /// 点击选择文件
  Future<void> _handleTap() async {
    FilePickerResult? res = await FilePicker.platform.pickFiles();
    if (res != null) {
      setState(() async {
        fileList.add(res!);
      });

      /// 视频会存储一个 Uint8List
      if (widget.fileType == 'video') {
        final Uint8List result =
            await _generateVideoCover(res.files.first.path!);
        setState(() {
          videoList.add(result);
        });
      }
    }
  }

  _generateVideoCover(String path) async {
    final result = await VideoThumbnail.thumbnailData(
      video: path,
      imageFormat: ImageFormat.JPEG,
      maxWidth:
          100, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      maxHeight: 100,
    );

    return result;
  }

  /// 预览图片或者视频
  _handleTapFile(dynamic file) {
    Navigator.pushNamed(context, 'previewFile',
        arguments: {'file': file, 'type': widget.fileType});
  }

  _renderImage() {
    final List<dynamic> list =
        widget.fileType == 'image' ? fileList : videoList;
    return list.map((item) {
      if (widget.fileType == 'image') {
        return GestureDetector(
          onTap: _handleTapFile(item),
          child: Image.file(
            File(item.files.first.path),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        );
      }

      if (widget.fileType == 'video') {
        return GestureDetector(
          child: Image.memory(
            item,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        );
      }
      return const Text('不支持的文件类型');
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ..._renderImage(),
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
