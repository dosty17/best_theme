import 'package:example/main.dart';
import 'package:example/my_theme.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.myColors.color1,
      width: 100,
      height: 100,
      child: const Text('second'),
    );
  }
}
