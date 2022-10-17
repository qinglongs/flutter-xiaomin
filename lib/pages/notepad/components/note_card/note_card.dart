import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoteCardState();
  }
}

class NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(253, 126, 126, 1)),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 0,
                    child: Container(
                      width: 60,
                      height: 70,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: Text(
                          'Expanded 可以使 Row、Column、Flex 里面的组件填充沿着主轴可利用的空间，如果多个 Widget 都使用了 Expanded 组件，可以使用 Expanded 的 flex 属性按照比例分配主轴空间，flex 属性相当于 Android LinearLayout 的 weight 属性，如下：。')),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Text('2022-03-01'), Text('日记')],
              )
            ],
          ),
        ));
  }
}
