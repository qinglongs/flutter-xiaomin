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

  /// 存储视频缩略图的列表
  final List<Uint8List> videoList = [];

  /// 获取选中文件
  List<FilePickerResult> getResult() {
    return fileList;
  }

  /// 点击选择文件
  Future<void> _handleTap() async {
    FilePickerResult? res = await FilePicker.platform.pickFiles();

    if (res != null) {
      /// 选择视频会通过 _generateVideoCover 获取视频中的截图作为封面展示
      if (widget.fileType == 'video') {
        final Uint8List result =
            await _generateVideoCover(res.files.first.path!);
        setState(() {
          videoList.add(result);
        });
      }

      setState(() {
        fileList.add(res);
      });
    }
  }

  _generateVideoCover(String path) async {
    final result = await VideoThumbnail.thumbnailData(
      video: path,
      imageFormat: ImageFormat.PNG,
      maxWidth:
          100, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      maxHeight: 100,
      quality: 1,
    );

    return result;
  }

  /// 预览图片
  _handleTapPreview(FilePickerResult file) {
    Navigator.pushNamed(context, 'previewFile',
        arguments: {'file': file.files.first.path, 'type': widget.fileType});
  }

  /// 渲染图片
  _renderImage() {
    return fileList.asMap().entries.map((entries) {
      /// 渲染图片
      if (widget.fileType == 'image') {
        return Container(
          margin: const EdgeInsets.only(right: 10),
          child: GestureDetector(
              onTap: () => _handleTapPreview(entries.value),
              child: Image.file(
                File(entries.value.files.first.path!),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )),
        );
      }

      /// 渲染视频缩略图
      if (widget.fileType == 'video') {
        return Container(
          margin: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () => _handleTapPreview(entries.value),
            child: Image.memory(
              videoList[entries.key],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
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
