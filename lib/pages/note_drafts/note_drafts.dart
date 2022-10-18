import 'package:flutter/cupertino.dart';
import 'package:flutter_xiaomin/layout/screen_scaffold/screen_scaffold.dart';
import 'package:flutter_xiaomin/pages/note_drafts/components/drafts_card/drafts_card.dart';

class NoteDrafts extends StatefulWidget {
  const NoteDrafts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoteDraftsState();
  }
}

class NoteDraftsState extends State<NoteDrafts> {
  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: '草稿箱',
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const DraftsCard(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const DraftsCard(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const DraftsCard(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const DraftsCard(),
            )
          ],
        ),
      ),
    );
  }
}
