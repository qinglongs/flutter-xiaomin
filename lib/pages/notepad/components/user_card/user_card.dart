import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/providers/theme.dart';
import 'package:flutter_xiaomin/utils/shard.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final globalTheme = context.watch<GlobalTheme>();

    /// 查看个人资料
    _handleTapUserAvatar() {
      Navigator.pushNamed(context, 'userInfo');
    }

    /// 进入草稿项
    _handleTapDrafts() {
      Navigator.pushNamed(context, 'noteDrafts');
    }

    /// 头像
    const String avatarUri =
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201505%2F04%2F20150504183354_zLZjV.jpeg&refer=http%3A%2F%2Fimg5q.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1668666155&t=de32c15e01c61b4c82a770896dcba7f2';

    return Container(
      width: size.width,
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 72,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _handleTapUserAvatar,
            child: Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: globalTheme.themeColor, width: 2),
                  color: const Color.fromRGBO(200, 126, 126, 1),
                  boxShadow: [
                    BoxShadow(
                        color: globalTheme.themeColor50,
                        blurRadius: 4,
                        spreadRadius: 2)
                  ],
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.network(avatarUri),
                )),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '小李子的大李子',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                      Container(
                        width: 69,
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(239, 241, 255, 0.5),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgUtils.svg('female'),
                            const Text(
                              '23岁',
                              style: TextStyle(
                                  color: Color.fromRGBO(127, 124, 124, 1),
                                  fontSize: 14),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: _handleTapDrafts,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '本地草稿1篇待发布',
                          style: TextStyle(
                              color: Color.fromRGBO(127, 124, 124, 1),
                              fontSize: 14),
                        ),
                        SvgUtils.svg('arrow_right')
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
