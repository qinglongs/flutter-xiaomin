import 'package:flutter/material.dart';

const String iamge =
    'https://scpic.chinaz.net/files/pic/pic9/201912/hpic1818.jpg';

class BillItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 200,
        child: Image.network(
          iamge,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
