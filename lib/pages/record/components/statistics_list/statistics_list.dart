import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

class StatisticsList extends StatefulWidget {
  const StatisticsList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StatisticsListState();
  }
}

class StatisticsListState extends State<StatisticsList> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 170,
      child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) => Container(
                color: Colors.white,
                child: ListTile(
                  minLeadingWidth: 24,
                  leading: SvgUtils.svg('water'),
                  title: const Text('大姨妈来了'),
                ),
              ),
          separatorBuilder: (BuildContext context, int index) => const Divider(
                height: 0.5,
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
          itemCount: 3),
    );
  }
}
