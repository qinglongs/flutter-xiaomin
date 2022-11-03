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

  /// 月经期
  List<int> currentDates = [9, 10, 11];

  /// 预测经期
  List<int> forecastDates = [10, 11, 12, 13, 14];

  /// 易孕期
  List<int> easyPregnancyDates = [6, 7, 8, 9, 15, 16, 17, 18, 19, 20, 21];

  /// 选中的日期
  var selectDate;

  /// 选中某一天
  _onTapDate(int date) {
    setState(() {
      selectDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
            children: dateList.map((date) {
              /// 是否当前时间
              bool isCurrent = currentDates.contains(date);

              /// 是否经期
              bool isForecast = forecastDates.contains(date);

              /// 是否易孕期
              bool isEasyPregnancy = easyPregnancyDates.contains(date);

              /// 是否选中
              bool isSelected = selectDate == date;

              Color? bgColor = isCurrent
                  ? const Color.fromRGBO(253, 126, 126, 1)
                  : isForecast
                      ? const Color.fromRGBO(255, 215, 215, 1)
                      : null;

              return GestureDetector(
                onTap: () => _onTapDate(date),
                child: Container(
                  decoration: BoxDecoration(
                      color: bgColor,
                      border: isSelected
                          ? Border.all(
                              color: const Color.fromRGBO(253, 126, 126, 1),
                              width: 1)
                          : null,
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '$date',
                      style: TextStyle(
                          color: isCurrent || isForecast
                              ? Colors.white
                              : isEasyPregnancy
                                  ? const Color.fromRGBO(184, 142, 218, 1)
                                  : null),
                    ),
                  ),
                ),
              );
            }).toList()),
      ]),
    );
  }
}
