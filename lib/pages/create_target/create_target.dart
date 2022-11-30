import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';
import 'package:flutter_xiaomin/components/tag/tag.dart';
import 'package:flutter_xiaomin/pages/create_target/components/button_icon/button_icon.dart';
import 'package:flutter_xiaomin/pages/create_target/components/step_input/step_input.dart';

class CreateTarget extends StatefulWidget {
  const CreateTarget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateTargetState();
  }
}

class CreateTargetState extends State<CreateTarget> {
  _onTapAddTime() {
    print('添加提醒时间');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenScaffold(
        title: '新建目标',
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 34),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(253, 126, 126, 1),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Text(
                    '学英语',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '时段',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: const [
                      Tag('任意时间',
                          closeable: true, margin: EdgeInsets.only(right: 10)),
                      Tag(
                        '早上',
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Tag('中午', margin: EdgeInsets.only(right: 10)),
                      Tag('晚上'),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  const Text(
                    '周期',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: const [
                      Tag('天', margin: EdgeInsets.only(right: 10)),
                      Tag('周', margin: EdgeInsets.only(right: 10)),
                      Tag('月'),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  const Text(
                    '次数',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const StepInput(),
                  const SizedBox(
                    height: 23,
                  ),
                  const Text(
                    '提醒时间',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      ButtonIcon(
                        icon: Icons.add,
                        onTap: _onTapAddTime,
                      ),
                      const Tag('11:00',
                          margin: EdgeInsets.only(right: 10, left: 10)),
                      const Tag('12:00'),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  const Text(
                    '打卡时间',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    '00:00-23:59',
                    style: TextStyle(
                        color: Color.fromRGBO(127, 124, 124, 1), fontSize: 14),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
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
        ));
  }
}
