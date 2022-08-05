import 'package:flutter/cupertino.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200,
        width: double.infinity,
        color: const Color.fromRGBO(253, 126, 126, 1),
        child: Text('用户卡片'));
  }
}
