import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/components/tag/tag.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';
import './components/target_card/target_card.dart';
import 'package:flutter_xiaomin/utils/shard.dart';
import './service.dart';

class ChooseTarget extends StatefulWidget {
  const ChooseTarget({Key? key}) : super(key: key);

  @override
  State<ChooseTarget> createState() {
    return ChooseTargetState();
  }
}

class ChooseTargetState extends State<ChooseTarget> {
  bool loading = false;
  List<GoalsType> goalTypes = [];

  List<String> list = ['学习', '运动', '健康', '生活'];

  int currentIndex = 0;

  getGoalsTyps() {
    setState(() {
      loading = true;
    });
    getGoalTypesOptions().then((value) {
      setState(() {
        goalTypes = value.data;
      });
    }).whenComplete(() {
      setState(() {
        loading = false;
      });
    });
  }

  /// 点击tag
  _onTapTag(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
    return ScreenScaffold(
      bodyPadding: const EdgeInsets.all(0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromRGBO(253, 126, 126, 1),
            child: Container(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: list.asMap().keys.map((index) {
                  bool active = currentIndex == index;

                  Color backgroundColor = active
                      ? const Color.fromRGBO(253, 126, 126, 1)
                      : Colors.white;

                  Color? color = active ? Colors.white : null;

                  return Tag(
                    list[index],
                    backgroundColor: backgroundColor,
                    color: color,
                    onTap: () => _onTapTag(index),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
              height: double.infinity,
              padding: const EdgeInsets.only(top: 30),
              color: Colors.pink,
              child:Center(
                child:  PageView(
                  scrollDirection: Axis.horizontal,

                  children: [
                    Wrap(
                      runSpacing: 9,
                      spacing: 9,
                      alignment: WrapAlignment.spaceAround,
                      children: const [
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                      ],
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 9,
                      spacing: 9,
                      children: const [
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                      ],
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 9,
                      spacing: 9,
                      children: const [
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                        TargetCard(),
                      ],
                    )

                  ],
                ),
              ))
        ],
      ),
    );
  }
}
