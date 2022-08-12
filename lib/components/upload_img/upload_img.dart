import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);
  @override
  UploadImageState  createState() {
    return UploadImageState();
  }
}

class UploadImageState extends State<UploadImage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('aaa'),
        Container(
          width: 100,
          height: 100,
          color: const Color.fromRGBO(196, 196, 196, 0.2),
          child: const Center(
            child: Icon(
              Icons.add,
              size: 30,
              color: Color.fromRGBO(127, 124, 124, 1),
            ),
          ),
        )
      ],
    );
  }
}
