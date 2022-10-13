import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class PreviewFile extends StatelessWidget {
  PreviewFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> query =
        ModalRoute.of(context)?.settings?.arguments as Map<dynamic, dynamic>;

    final String file = query['file'] as String;

    final String type = query['type'] as String;

    if (type == 'image') {
      return Image.file(File(file));
    }

    if (type == 'video') {
      return const Center(child: Text('预览视频  '));
    }

    return const Center(child: Text('暂不支持此类文件预览示！'));
  }
}
