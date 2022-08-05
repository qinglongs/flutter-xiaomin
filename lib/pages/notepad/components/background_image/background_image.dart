import 'package:flutter/cupertino.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 232,
        width: double.infinity,
        color: const Color.fromRGBO(253, 126, 126, 1),
        child: Center(child: Text('用户卡片')));
  }
}
