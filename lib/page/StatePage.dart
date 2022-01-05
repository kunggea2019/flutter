// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StatePage extends StatefulWidget {
  const StatePage({Key? key}) : super(key: key);
  static const routeName = '/state';

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  // state控件内部管理state
  var name = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      color: Colors.green,
      margin: const EdgeInsets.all(22),
      padding: const EdgeInsets.all(33),
      child: GestureDetector(
        onTap: () {
          setState(() {
            name++;
          });
        },
        child: Text(
          'num = $name',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 33,
          ),
        ),
      ),
    );
  }
}
