import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

class TargetRecordCard extends StatefulWidget {
  const TargetRecordCard({Key? key, this.isOver}) : super(key: key);

  final bool? isOver;

  @override
  State<StatefulWidget> createState() {
    return TargetRecordCardState();
  }
}

class TargetRecordCardState extends State<TargetRecordCard> {
  @override
  Widget build(BuildContext context) {
    /// 图标
    var icon =
        SvgUtils.svg(widget.isOver == true ? 'over-target' : 'pending-target');

    /// 背景色
    Color backgroundColor = widget.isOver == true
        ? const Color.fromRGBO(253, 194, 194, 1)
        : Colors.white;

    /// 边框
    BoxBorder? border = widget.isOver == true
        ? null
        : Border.all(color: const Color.fromRGBO(253, 194, 194, 1), width: 1);

    /// 标题文字颜色
    Color labelTextColor = widget.isOver == true ? Colors.white : Colors.black;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  '学英语',
                  style: TextStyle(
                      fontSize: 14,
                      color: labelTextColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              widget.isOver == true
                  ? Row(
                      children: [
                        const Text(
                          '已打卡：1',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Container(
                          width: 1,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(217, 217, 217, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1))),
                          margin: const EdgeInsets.only(left: 10, right: 10),
                        ),
                        const Text('剩余：6',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ],
                    )
                  : const Text(
                      '00:00-23:59',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(191, 191, 191, 1)),
                    ),
              Container(
                width: 117,
                height: 4,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(2))),
              )
            ],
          ),
          icon,
        ],
      ),
    );
  }
}
