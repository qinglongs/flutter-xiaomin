import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import "package:file_picker/file_picker.dart";
import 'package:video_thumbnail/video_thumbnail.dart';

typedef OnChooseFile = void Function({required FilePickerResult file});

class ChooseFile extends StatefulWidget {
  final int? maxSize;

  final String? fileType;

  final OnChooseFile? onChooseFile;

  const ChooseFile(
      {Key? key, this.maxSize = 3, this.fileType = 'image', this.onChooseFile})
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

      /// 触发成功选择文件的回调
      if (widget.onChooseFile != null) widget.onChooseFile!(file: res);
    }
  }

  /// 生成视频缩略图封面
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


  /// 删除选中的文件
  handleTapCloseIcon(int index) {
    setState(() {
      fileList.remove(fileList[index]);
      if (widget.fileType == 'video') videoList.remove(videoList[index]);
    });
  }

  /// 渲染图片
  _renderImage() {



    /// 带关闭 icon 的预览容器
    Widget _closableBox({required int index, required Widget child}) {
      final int key = index;
      return SizedBox(
        width: 115,
        height: 110,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                  width: 100,
                  height: 100,
                  child: GestureDetector(
                      onTap: () => _handleTapPreview(fileList[key]),
                      child: child)),
            ),
            Positioned(
              top: 5,
              right: 10,
              child: GestureDetector(
                onTap: () => handleTapCloseIcon(index),
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(253, 126, 126, 1),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return fileList.asMap().keys.map((key) {
      /// 渲染图片
      if (widget.fileType == 'image') {
        return _closableBox(
            index: key,
            child: Image.file(
              File(fileList[key].files.first.path!),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ));
      }

      /// 渲染视频缩略图
      if (widget.fileType == 'video') {
        return _closableBox(
            index: key,
            child: Image.memory(
              videoList[key],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ));
      }
      return _closableBox(
          index: key, child: const Text('an unsupported file type'));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ..._renderImage(),
        fileList.length < widget.maxSize!
            ? GestureDetector(
                onTap: _handleTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
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
