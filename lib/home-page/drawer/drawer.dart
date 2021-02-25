import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 头像
const String image =
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202007%2F13%2F20200713091206_jmxgw.thumb.400_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616826314&t=85922effdd7869c2ad21f0cb8749ecc2';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyDrawerState();
  }
}

class MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    // 3
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: EdgeInsets.all(10),
        width: 350,
        height: double.infinity,
        color: Colors.pink[300],
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white54,
                    padding: EdgeInsets.all(6),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: ClipOval(
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '小黑',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '前途似海，来日方长',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                '924229679@qq.com',
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white54,
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white24, width: 0.5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('主题配置'),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white24, width: 0.5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('主题配置'),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white24, width: 0.5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('主题配置'),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('主题配置'),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    // 1
    super.initState();
    print('initState');
  }

  @override
  void didUpdateWidget(MyDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // 销毁 1
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    // 销毁 2
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    // 2
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

// 初始化  initState didChangeDependencies build

// setState build

// 离开页面 deactivate dispose
