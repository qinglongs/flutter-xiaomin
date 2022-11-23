import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TargetCard extends StatefulWidget {
  const TargetCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TargetCardState();
  }
}

class TargetCardState extends State<TargetCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 108,
      height: 136,
      padding: EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,

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
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text('学英语'),
          )
        ],
      ),
    );
  }
}
