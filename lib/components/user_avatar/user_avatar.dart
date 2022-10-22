import 'package:flutter/cupertino.dart';

void voidFunction() {}

class UserAvatar extends StatefulWidget {
  const UserAvatar(
      {Key? key,
      this.handleTapUserAvatar = voidFunction,
      this.width = 70,
      this.height = 70,
      this.margin})
      : super(key: key);

  final void Function()? handleTapUserAvatar;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserAvatarState();
  }
}

class UserAvatarState extends State<UserAvatar> {
  /// 头像
  String avatarUri =
      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201505%2F04%2F20150504183354_zLZjV.jpeg&refer=http%3A%2F%2Fimg5q.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1668666155&t=de32c15e01c61b4c82a770896dcba7f2';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: widget.handleTapUserAvatar,
      child: Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(253, 126, 126, 1), width: 2),
            color: const Color.fromRGBO(200, 126, 126, 1),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(253, 126, 126, 0.5),
                  blurRadius: 4,
                  spreadRadius: 2)
            ],
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.network(avatarUri),
          )),
    );
  }
}
