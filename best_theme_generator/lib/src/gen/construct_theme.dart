class ConstructTheme {
  constructTheme(StringBuffer buffer, String className, vars, keys) {
    buffer.writeln(
        '_\$$className({required List<BestColor> myColors, ThemeMode mode = ThemeMode.system}) {');

    buffer.writeln('currentTheme=_themeNotifier.value;');

    buffer.writeln('myColors.forEach((color) {');
    buffer.writeln("_colors[color.name] = color.toMap();");
    buffer.writeln('});');

    if (vars.isNotEmpty) {
      for (var eC in vars) {
        buffer.writeln(
            "${eC.toString().replaceFirst('_', '')} = _colors['${eC.toString().replaceFirst('_', '')}']!['light']!;");
      }
    } else {
      for (var eC in keys) {
        buffer.writeln(
            "${eC.toString().replaceFirst('_', '')} = _colors['${eC.toString().replaceFirst('_', '')}']!['light']!;");
      }
    }

    buffer.writeln('''
if (mode != ThemeMode.system) {
      if (mode == ThemeMode.dark) {
        toDark();
      } else {
        toLight();
      }
    }
''');
    buffer.writeln('}');
  }
}
