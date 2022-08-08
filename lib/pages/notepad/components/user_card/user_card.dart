import 'package:flutter/cupertino.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 72,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(right: 8),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(200, 126, 126, 1),
              shape: BoxShape.circle,
            ),
          ),
          const Text(
            '小李子的大李子',
            style: TextStyle(
                fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
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
                  children: [SvgUtils.svg('female'), const Text('23岁')],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
