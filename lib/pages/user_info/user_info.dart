import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserInfoState();
  }
}

class UserInfoState extends State<UserInfo> {
  final Map<String, String> firstMap = {
    'avatar': '头像',
    'sex': '性别',
  };

  final Map<String, String> secondMap = {
    'nickName': '昵称',
    'birthday': '生日',
    'email': '邮箱'
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenScaffold(
        title: '编辑资料',
        bodyPadding: const EdgeInsets.all(0),
        body:Column(
          children: [
            SizedBox(
              height: 120,
              child: ListView.separated(
                itemCount: firstMap.length,
                itemBuilder: (BuildContext context, int index) {
                  final key = [...firstMap.keys].asMap()[index];
                  return Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    color: Colors.white,
                    height: 52,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          firstMap[key]!,
                          style: const TextStyle(
                              color: Color.fromRGBO(127, 124, 124, 1),
                              fontSize: 16),
                        ),
                        const Text(
                          'hello world',
                          style: TextStyle(
                              color: Color.fromRGBO(127, 124, 124, 1),
                              fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  height: 0.5,
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: secondMap.length,
                itemBuilder: (BuildContext context, int index) {
                  final key = [...secondMap.keys].asMap()[index];
                  return Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    color: Colors.white,
                    height: 52,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          secondMap[key]!,
                          style: const TextStyle(
                              color: Color.fromRGBO(127, 124, 124, 1),
                              fontSize: 16),
                        ),
                        const Text(
                          'hello world',
                          style: TextStyle(
                              color: Color.fromRGBO(127, 124, 124, 1),
                              fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  height: 0.5,
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
            )
          ],
        ));
  }
}
