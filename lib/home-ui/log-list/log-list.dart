import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> renderList<T>(List<T> list, {Function onTapListItem}) {
  return list.map((dynamic e) {
    return ListTile(
      onTap: onTapListItem(e['title']),
      title: Text(e['title']),
      subtitle: Text(e['content']),
      leading: Icon(Icons.face),
    );
  }).toList();
}
