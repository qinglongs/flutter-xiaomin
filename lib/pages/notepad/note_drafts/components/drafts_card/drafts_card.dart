import 'package:flutter/material.dart';
import 'package:flutter_xiaomin/providers/theme.dart';
import 'package:provider/provider.dart';

class DraftsCard extends StatefulWidget {
  const DraftsCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DraftsCardState();
  }
}

class DraftsCardState extends State<DraftsCard> {
  String text =
      '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈';

  bool showMask = false;

  _handleTapEditDrafts() {
    Navigator.pushNamed(context, 'addNote');
  }

  /// 长按唤起删除
  _handleLongPress() {
    setState(() {
      showMask = true;
    });
  }

  /// 删除草稿
  _handleTapDeleteDraft() {
    print('删除草稿');
  }

  /// 点击蒙层
  _handleTapMask() {
    setState(() {
      showMask = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeOptions = context.watch<GlobalTheme>();
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: _handleTapEditDrafts,
          onLongPress: _handleLongPress,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border:
                    Border.all(color: const Color.fromRGBO(253, 126, 126, 1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text('2022-10-31 11:30',
                      style: TextStyle(
                          color: Color.fromRGBO(127, 124, 124, 1),
                          fontSize: 12))
                ],
              ),
            ),
          ),
        ),
        showMask
            ? Positioned(
                child: GestureDetector(
                onTap: _handleTapMask,
                child: Container(
                  width: double.infinity,
                  height: 113,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                      child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: themeOptions.themeColor),
                          child: GestureDetector(
                            onTap: _handleTapDeleteDraft,
                            child: const Center(
                              child: Text(
                                '删除',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))),
                ),
              ))
            : const SizedBox()
      ],
    );
  }
}
