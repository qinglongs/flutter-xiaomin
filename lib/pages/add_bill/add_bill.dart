import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';
import 'package:flutter_xiaomin/pages/add_bill/components/tag/tag.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

class AddBill extends StatefulWidget {
  const AddBill({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddBillState();
  }
}

class AddBillState extends State<AddBill> {
  @override
  void initState() {
    // TODO: implement initState
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
        title: '支出',
        bodyPadding: EdgeInsets.zero,
        appbarOption: AppbarOption(
            backgroundColor: const Color.fromRGBO(253, 126, 126, 1),
            iconColor: Colors.white,
            titleColor: Colors.white),
        body: Container(
          height: 132,
          color: Colors.white,
          padding: const EdgeInsets.only(top: 36),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Tag(text: '支付宝'),
                        Tag(
                          text: '微信',
                          active: true,
                        ),
                        Tag(text: '现金'),
                      ],
                    ),
                    const Tag(
                      text: '今天',
                      icon: Icons.arrow_drop_down,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 12, left: 16, right: 16),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.25), width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Text(
                          '礼物',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    const Text(
                      '200',
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 59,
                      height: 56,
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 32),
                child: TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.only(top: 3, bottom: 3),
                      child: const Center(
                        child: Text('保存'),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
