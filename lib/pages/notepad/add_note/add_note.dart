import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/components/choose_file/choose_file.dart';
import 'package:flutter_xiaomin/components/tag/tag.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return ScreenScaffold(
      title: '添加事件',
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.more_vert,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackBar')));
          },
        ),
      ],
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromRGBO(247, 249, 252, 1),
            Color.fromRGBO(255, 242, 242, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        width: size.width,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "在这里写下想要记录等事件吧 ...", border: InputBorder.none),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      child: Text('图片'),
                      height: 30,
                    ),
                    ChooseFile(fileType: 'image',),
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      child: Text('视频'),
                      height: 30,
                    ),
                    ChooseFile(fileType: 'video',maxSize: 2,),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 52),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      child: Text('事件类型'),
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: const Tag(
                            '日记',
                            closeable: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: const Tag('见闻'),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: const Tag('学习心得'),
                        ),
                      ],
                    )
                  ],
                )),
            TextButton(
              onPressed: () {
                debugPrint('Received click');
              },
              child: const SizedBox(
                width: double.infinity,
                height: 30,
                child: Center(
                  child: Text('保存'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
