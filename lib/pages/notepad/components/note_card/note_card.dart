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

  /// mock图片
  static String uri =
      'https://t7.baidu.com/it/u=1785207335,3397162108&fm=193&f=GIF';


  /// mock文本
  String text =
      'Expanded 可以使 Row、Column、Flex 里面的组件填充沿着主轴可利用的空间，如果多个 Widget 都使用了 Expanded 组件，可以使用 Expanded 的 flex 属性按照比例分配主轴空间，flex 属性相当于 Android LinearLayout 的 weight 属性，如下：。';

  _handleTapNoteCard() {
    Navigator.pushNamed(context, 'noteDetail');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTapNoteCard,
      child: Container(
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
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Image.network(
                          uri,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          text,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      '2022-03-01',
                      style: TextStyle(
                          color: Color.fromRGBO(127, 124, 124, 1),
                          fontSize: 12),
                    ),
                    Text(
                      '日记',
                      style: TextStyle(color: Color.fromRGBO(253, 126, 126, 1)),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
