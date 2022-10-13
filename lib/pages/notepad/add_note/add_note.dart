import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/components/choose_file/choose_file.dart';
import 'package:flutter_xiaomin/components/tag/tag.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('添加事件'),
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
      ),
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
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "在这里写下想要记录等事件吧 ...",
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      child: Text('图片'),
                      height: 30,
                    ),
                    ChooseFile(),
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      child: Text('视频'),
                      height: 30,
                    ),
                    ChooseFile(),
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      child: Text('事件类型'),
                      height: 30,
                    ),
                    Tag()
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
