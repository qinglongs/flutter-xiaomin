import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({Key? key, this.onTap, required this.icon})
      : super(key: key);

  final void Function()? onTap;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 31,
      height: 31,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Icon(
            icon,
            color: const Color.fromRGBO(253, 126, 126, 1),
          ),
        ),
      ),
    );
  }
}
