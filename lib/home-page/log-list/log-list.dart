import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/log.dart';

// https://blog.ziyiu.com/2019/12/02/Flutter/flutter%E7%88%B6%E7%BB%84%E4%BB%B6%E8%B0%83%E7%94%A8%E5%AD%90%E7%BB%84%E4%BB%B6%E6%96%B9%E6%B3%95/
GlobalKey<RenderList> childKey = GlobalKey();

class Loglist extends StatefulWidget {
  Loglist({
    Key key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return RenderList();
  }
}

class RenderList extends State<Loglist> {
  List _list = [];

  // 滚动事件监听
  ScrollController _scrollController = ScrollController(); //listview的控制器

  bool _isNomore = false;

  bool _isFetching = false;

  // 记事本分页参数
  Map<String, int> _pageParams = {'page': 1, 'size': 10};

  Future<void> fetchList({bool refresh}) async {
    if (_isFetching) return;

    if (refresh == true) {
      _isNomore = false;
    }

    if (_isNomore) return;

    _isFetching = true;

    setState(() {
      _pageParams = {
        'page': refresh == true ? 1 : _pageParams['page'] + 1,
        'size': 10
      };
    });

    try {
      var res = await getLogList(_pageParams);

      // 获取list 数据
      List temp = res['data']['list'];

      // 数据总数
      int total = res['data']['total'];

      // 判断是否还有数据
      if (_list.length == total) {
        _isNomore = true;
      }

      // 组合数据
      var concatList = [..._list, ...temp];

      // 更新数据
      setState(() {
        _list = refresh == true ? temp : concatList;
      });
    } finally {
      _isFetching = false;
    }
  }

  Future<void> _onRefresh() {
    return fetchList(refresh: true);
  }

  // 点击记事本列表的某个元素
  _onTapListItem(Map e) {
    return () => // 路由跳转
        Navigator.pushNamed(context, 'log-page', arguments: e).then((value) {
          if (value != null) fetchList(refresh: true);
        });
  }

  // init
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero).then((v) async {
      fetchList(refresh: true);
    });

    // 监听滚动事件
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchList(refresh: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // backgroundColor: Colors.pink[300],
      onRefresh: _onRefresh,
      child: ListView(
        controller: _scrollController,
        children: _list.map((dynamic e) {
          return ListTile(
            key: Key('${e['id']}'),
            onTap: _onTapListItem(e),
            title: Text('${e['title']}${e['id']}'),
            subtitle: Text(
              e['content'],
              // style: TextStyle(color: Colors.grey),
            ),
            leading: SizedBox(
              width: 80,
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: e['image'].indexOf('http') > -1
                    ? Image.network(
                        e['image'],
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        e['image'],
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}