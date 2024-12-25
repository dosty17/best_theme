// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, prefer_final_fields

// import 'package:best_theme/best_theme.dart';
// import 'package:best_theme_annotation/best_theme_annotation.dart';
import 'package:best_theme/best_theme.dart';
import 'package:best_theme_annotation/best_theme_annotation.dart';
import 'package:flutter/material.dart';
part 'my_theme.g.dart';

List<BestColor> dataColor = [
  const BestColor(name: 'color1', light: Colors.white, dark: Colors.black),
  const BestColor(name: 'color2', light: Colors.black, dark: Colors.white),
  const BestColor(name: 'color3', light: Colors.amber, dark: Colors.red),
  const BestColor(name: 'color4', light: Colors.amber, dark: Colors.red),
  const BestColor(name: 'grey2', light: Colors.grey, dark: Colors.blueGrey),
  const BestColor(
      name: 'grey3', light: Colors.grey, dark: Color.fromARGB(255, 3, 43, 63)),
];

@BestTheme(vars: [
  'color1',
  'color2',
  'color3',
  'color4',
  'grey2',
  'grey3',
])
class Mytheme extends _$Mytheme {
  Mytheme() : super(myColors: dataColor, mode: ThemeMode.system);
}
