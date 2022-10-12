import 'package:flutter/cupertino.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return SizedBox(
      height: 232,
      width: size.width,
      child: const Image(
        image: AssetImage('assets/image/head-background.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
