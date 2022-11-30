import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/pages/target/components/target_record_card/target_record_card.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

class Target extends StatefulWidget {
  const Target({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TargetState();
  }
}

class TargetState extends State<Target> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setAppbar(backgroundColor: Colors.transparent,theme: Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: Column(
        children:  [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const TargetRecordCard(isOver: true,),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const TargetRecordCard(),
          ),
          const TargetRecordCard(),
        ],
      ),
    );
  }
}
