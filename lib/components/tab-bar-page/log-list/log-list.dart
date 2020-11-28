import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> renderList<T>(List<T> list, {Function onTapListItem}) {
  return list.map((e) {
    return ListTile(
      onTap: onTapListItem('第$e件事....'),
      title: Text('第$e件事....'),
      subtitle: Text('2020年11月27日16点47分'),
      leading: Icon(Icons.face),
    );
  }).toList();
}
