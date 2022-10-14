import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

enum SOURCE_TYPE { file, network, memory }

class VideoApp extends StatefulWidget {
  final SOURCE_TYPE? sourceType;
  final dynamic source;

  const VideoApp({Key? key, this.sourceType, this.source}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VideoPlayerState();
  }
}

class VideoPlayerState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    /// 网络视频
    if (widget.sourceType == SOURCE_TYPE.network) {
      _controller = VideoPlayerController.network(widget.source
        ..initialize().then((_) {
          _controller.play();
          // 确保在初始化视频后显示第一帧，直至在按下播放按钮。
          setState(() {});
        }));
    }

    /// 手机文件
    if (widget.sourceType == SOURCE_TYPE.file) {
      _controller = VideoPlayerController.file(File(widget.source))
        ..initialize().then((value) {
          _controller.play();
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        //如果视频没有加载好或者因网络原因加载不出来则返回Container 组件
        //一般用于放置过渡画面
        : const Text("没有要播放的视频");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
