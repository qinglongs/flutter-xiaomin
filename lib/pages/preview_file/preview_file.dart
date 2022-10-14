import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_xiaomin/components/preview_video/preview_video.dart';
import 'package:photo_view/photo_view.dart';

class PreviewFile extends StatelessWidget {
  const PreviewFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> query =
        ModalRoute.of(context)?.settings?.arguments as Map<dynamic, dynamic>;

    final String file = query['file'] as String;

    final String type = query['type'] as String;

    if (type == 'image') {
      return PhotoView(imageProvider: FileImage(File(file)));
    }

    if (type == 'video') {
      return Center(
          child: VideoApp(
        sourceType: SOURCE_TYPE.file,
        source: file,
      ));
    }

    return const Center(child: Text('暂不支持此类文件预览示！'));
  }
}
