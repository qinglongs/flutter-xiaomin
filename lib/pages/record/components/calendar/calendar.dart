import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalendarState();
  }
}

class CalendarState extends State<Calendar> {
  final List<String> list = ['日', '一', '二', '三', '四', '五', '六'];

  final List<dynamic> dateList = [
    '',
    '',
    '',
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];

  /// 当前时间
  int currentDate = 12;

  /// 预测经期
  List<int> forecastDates = [10, 11, 12, 13, 14];

  /// 易孕期
  List<int> easyPregnancyDates = [6, 7, 8, 9, 15, 16, 17, 18, 19, 20, 21];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(children: [
        Wrap(
            runSpacing: 1,
            spacing: 1,
            children: list
                .map((e) => SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(e),
                      ),
                    ))
                .toList()),
        Wrap(
            runSpacing: 1,
            spacing: 1,
            direction: Axis.horizontal,
            children: dateList.map((e) {
              /// 是否当前时间
              bool isCurrent = currentDate == e;
              /// 是否经期
              bool isForecast = forecastDates.contains(e);
              /// 是否易孕期
              bool isEasyPregnancy = easyPregnancyDates.contains(e);

              Color? bgColor = isCurrent
                  ? const Color.fromRGBO(253, 126, 126, 1)
                  : isForecast
                      ? const Color.fromRGBO(255, 215, 215, 1)
                      : null;

              return Container(
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    '$e',
                    style: TextStyle(
                        color: isCurrent || isForecast
                            ? Colors.white
                            : isEasyPregnancy? const Color.fromRGBO(184, 142, 218, 1):null),
                  ),
                ),
              );
            }).toList()),
      ]),
    );
  }
}
