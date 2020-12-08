import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/log.dart';

import '../../router.dart';

class ListState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RenderList();
  }
}

class RenderList extends State<ListState> {
  List _list = [];

  // 滚动事件监听
  ScrollController _scrollController = ScrollController(); //listview的控制器

  bool _isNomore = false;

  bool _isFetching = false;

  // 记事本分页参数
  Map<String, int> _pageParams = {'page': 1, 'size': 10};

  Future<void> _fetchList({bool refresh}) async {
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
    _isFetching = false;
  }

  Future<void> _onRefresh() {
    return _fetchList(refresh: false);
  }

  // 点击记事本列表的某个元素
  _onTapListItem(Map e) {
    return () => // 路由跳转
        myRouter.push(context: context, url: 'log-page', params: e);
  }

  // init
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero).then((v) async {
      _fetchList(refresh: true);
    });

    // 监听滚动事件
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchList(refresh: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.pink[300],
      onRefresh: _onRefresh,
      child: ListView(
        controller: _scrollController,
        children: _list.map((dynamic e) {
          return ListTile(
            onTap: _onTapListItem(e),
            title: Text('${e['title']}${e['id']}'),
            subtitle: Text(e['content']),
            leading: Image.network(e['image']),
          );
        }).toList(),
      ),
    );
  }
}