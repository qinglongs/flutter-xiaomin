import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './service.dart';

class Target extends StatefulWidget {
  const Target({Key? key}) : super(key: key);

  @override
  State<Target> createState() {
    return TargetState();
  }
}

class TargetState extends State<Target> {
  bool loading = false;
  List<GoalsType> goalTypes = [];

  getGoalsTyps() {
    setState(() {
      loading = true;
    });
    getGoalTypesOptions().then((value) {
      setState(() {
        goalTypes = value.data;
      });
    }).whenComplete(() {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Text(
      '目标',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
