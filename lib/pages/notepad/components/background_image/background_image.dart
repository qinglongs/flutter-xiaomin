import 'package:flutter/cupertino.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  const SizedBox(
        height: 232,
        width: double.infinity,
        child:Image(image: AssetImage('image/head-background.png'),fit: BoxFit.fill,),
    );
  }
}
