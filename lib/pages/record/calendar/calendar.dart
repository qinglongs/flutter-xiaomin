import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalendarState();
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(0)),
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
              maxWidth: 48,
              maxHeight: 48,
            ),
            child: Container(
              color: Colors.red,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
              maxWidth: 48,
              maxHeight: 48,
            ),
            child: Container(
              color: Colors.red,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
              maxWidth: 48,
              maxHeight: 48,
            ),
            child: Container(
              color: Colors.red,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
              maxWidth: 48,
              maxHeight: 48,
            ),
            child: Container(
              color: Colors.red,
            ),
          ),ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
              maxWidth: 48,
              maxHeight: 48,
            ),
            child: Container(
              color: Colors.red,
            ),
          ),


        ],
      ),
    );
  }
}
