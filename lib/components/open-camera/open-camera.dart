import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../show-action/show-action.dart';

class OpenCamera {
  // 选择的图片
  PickedFile image;
  // 打开相机
  Future<PickedFile> openCamera() async {
    // 获取拍照图片
    final image = await ImagePicker().getImage(source: ImageSource.camera);

    return image;
  }

  // 打开相册
  Future<PickedFile> openGallery() async {
    // 获取相册图片
    image = await ImagePicker().getImage(source: ImageSource.gallery);

    return image;
  }

  // 点击+号按钮
  tapPickImage(context, Function callback) {
    // 打开相机
    Future<void> openCamera() async {
      // 关闭弹窗
      Navigator.pop(context);

      // 获取拍照图片
      image = await openMyCamera.openCamera();

      if (image != null) {
        callback(image);
      }
    }

    // 打开相册
    Future<void> openGallery() async {
      // 关闭弹窗
      Navigator.pop(context);

      // 获取相册图片
      image = await openMyCamera.openGallery();

      if (image != null) {
        callback(image);
      }
    }

    // 动作面板选项
    final List<Map<String, dynamic>> actionList = [
      {'action': openCamera, 'text': '相机'},
      {'action': openGallery, 'text': '相册'},
      {'action': openGallery, 'text': '视频'}
    ];

    // 展示动作面板
    actionSheet.showAction(context,
        showContent: actionList.map((item) {
          return ListTile(
            onTap: item['action'],
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(item['text'])],
            ),
          );
        }).toList());
  }
}

OpenCamera openMyCamera = OpenCamera();
