import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyDrawerState();
  }
}

class MyDrawerState extends State<MyDrawer> {
  int _num = 0;
  @override
  Widget build(BuildContext context) {
    // 3
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        width: 300,
        height: double.infinity,
        color: Colors.white,
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('$_num'),
                Container(
                  width: double.infinity,
                  child: IconButton(
                      icon: Text('请点我'),
                      onPressed: () {
                        setState(() {
                          _num = _num + 1;
                        });
                      }),
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
