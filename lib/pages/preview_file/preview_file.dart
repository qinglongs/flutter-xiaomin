import 'package:flutter/cupertino.dart';
import "package:file_picker/file_picker.dart";
import 'package:photo_view/photo_view.dart';

class PreviewFile extends StatelessWidget {
  PreviewFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> query =
        ModalRoute.of(context)?.settings?.arguments as Map<dynamic, dynamic>;

    final FilePickerResult file = query['file'] as FilePickerResult;

    final String type = query['type'] as String;

    if (type == 'image') {
      return PhotoView(imageProvider: AssetImage(file.files.first.path!));
    }

    if (type == 'video') {
      return const Center(child: Text('预览视频  '));
    }

    return const Center(child: Text('暂不支持此类文件预览示！'));
  }
}
