import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/pages/bill/components/not_data/not_data.dart';
import 'package:flutter_xiaomin/utils/shard.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BillState();
  }
}

class BillState extends State<Bill> {
  @override
  void initState() {
    super.initState();
    setAppbar(backgroundColor: const Color.fromRGBO(253, 126, 126, 1));
  }

  @override
  void deactivate () {
    super.deactivate();
    setAppbar(backgroundColor: Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color.fromRGBO(253, 126, 126, 1),
          padding: const EdgeInsets.only(top: 40, bottom: 4, left: 16),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: Row(
                  children: const [
                    Text(
                      '2022/03/06',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const Text('总支出：100', style: TextStyle(color: Colors.white)),
              const Text('总收入：100', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const NoData()
      ],
    );
  }
}
