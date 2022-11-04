import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/pages/record/components/calendar/calendar.dart';
import 'package:flutter_xiaomin/pages/record/components/calendar_label/calendar_label.dart';
import 'package:flutter_xiaomin/pages/record/components/statistics_list/statistics_list.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

import 'components/calendar/calendar.dart';

class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecordState();
  }
}

class RecordState extends State<Record> {
  @override
  void initState() {
    super.initState();
    setAppbar(backgroundColor: const Color.fromRGBO(253, 126, 126, 1));
  }

  @override
  void deactivate() {
    super.deactivate();
    setAppbar(backgroundColor: Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            child: Container(
              color: const Color.fromRGBO(253, 126, 126, 1),
              padding: const EdgeInsets.only(top: 8, left: 16, bottom: 20),
              child: const Text(
                '2022年3月',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )),
        Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: SizedBox(
                height: 300,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: size.width,
                      child: const Calendar(),
                    ),
                    SizedBox(
                      width: size.width,
                      child: const Calendar(),
                    ),
                    SizedBox(
                      width: size.width,
                      child: const Calendar(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 16, bottom: 25),
              child: Row(
                children: const [
                  CalendarLabel(
                    title: '月经期',
                  ),
                  CalendarLabel(
                    title: '预测经期',
                  ),
                  CalendarLabel(title: '易孕期'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const StatisticsList(),
            )
          ],
        )
      ],
    );
  }
}
