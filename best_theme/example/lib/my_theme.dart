import 'package:best_theme/best_theme.dart';
import 'package:best_theme_annotation/best_theme_annotation.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

@BestTheme(extensionName: 'myColors')
class MyTheme extends _$MyTheme {
  static const color1 = BestColor(light: Colors.white, dark: Colors.black);
  static const color2 = BestColor(light: Colors.black, dark: Colors.white);
  static const color3 = BestColor(light: Colors.amber, dark: Colors.red);
  static const grey23 = BestColor(light: Colors.grey, dark: Colors.blueGrey);

  // 2. Text Styles
  static const titleLarge = BestTextStyle(
    light: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    dark: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
  );

  // 3. Assets
  static const appLogo = BestAsset(
    light: 'assets/images/logo_light.png',
    dark: 'assets/images/logo_dark.png',
  );
}
