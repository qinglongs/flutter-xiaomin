import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/bill-item/bill-item.dart';

class Bill extends StatefulWidget {
  Widget children;

  Bill(this.children);

  @override
  State<StatefulWidget> createState() {
    return BillState();
  }
}

class BillState extends State<Bill> {
  /// 屏幕滚动控制器
  final ScrollController _scrollController = ScrollController();

  /// loading
  bool _loading = false;

  /// 发起请求时的时间
  int _time = DateTime.now().millisecondsSinceEpoch;

  /// 分页请求参数
  Map<String, int> _pageParams = {'page': 1, 'size': 10};

  @override
  void initState() {
    super.initState();

    /// 滚动监听
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 获取当前时间
        int time = DateTime.now().millisecondsSinceEpoch;

        // 计算上次请求和这次请求的时间间隔
        int diffTime = time - _time;

        // 做一个节流 1s钟内不允许重复请求
        if (_loading || diffTime < 1000) return;

        setState(() {
          _loading = true;
        });

        Future.delayed(Duration(seconds: 2)).then((value) {
          setState(() {
            _loading = false;
          });

          // 更新时间戳
          _time = DateTime.now().millisecondsSinceEpoch;
        });
      }
    });
  }

  /// 下拉加载
  Future<dynamic> _onRefrsh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Wrap(
            runSpacing: 10,
            alignment: WrapAlignment.start,
            children: [
              BillItem(),
              BillItem(),
              BillItem(),
              BillItem(),
              BillItem(),
              BillItem(),
              BillItem(),
              Container(
                // height: 30,
                padding: EdgeInsets.only(bottom: _loading ? 5 : 0),
                width: double.infinity,
                child: Text(
                  _loading ? '数据加载中...' : '',
                  textAlign: TextAlign.center,
                  style: TextStyle(textBaseline: TextBaseline.alphabetic),
                ),
              )
            ],
          ),
        ),
        onRefresh: _onRefrsh);
  }
}
