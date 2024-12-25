class ToolTheme {
  toolTheme(StringBuffer buffer, vars, keys) {
    buffer.writeln('toggleColor() {');
    if (vars.isNotEmpty) {
      for (var eC in vars) {
        buffer.writeln(
            "${eC.toString().replaceFirst('_', '')} = _colors['${eC.toString().replaceFirst('_', '')}']![isDark ? 'dark' : 'light']!;");
      }
    } else {
      for (var eC in keys) {
        buffer.writeln(
            "${eC.toString().replaceFirst('_', '')} = _colors['${eC.toString().replaceFirst('_', '')}']![isDark ? 'dark' : 'light']!;");
      }
    }

    buffer.writeln('}');
    buffer.writeln('toggle() {');

    buffer.writeln('isDark = !isDark;');
    buffer.writeln('''
    if(isDark){
    _themeNotifier.value=ThemeMode.dark;
    }else{
    _themeNotifier.value=ThemeMode.light;
    }
''');
    buffer.writeln('currentTheme=_themeNotifier.value;');
    buffer.writeln('toggleColor();');
    buffer.writeln('}');

    buffer.writeln('toDark() {');
    buffer.writeln('isDark = true;');
    buffer.writeln('_themeNotifier.value = ThemeMode.dark;');
    buffer.writeln('currentTheme=_themeNotifier.value;');
    buffer.writeln('toggleColor();');
    buffer.writeln('}');

    buffer.writeln('toLight() {');
    buffer.writeln('isDark = false;');
    buffer.writeln('_themeNotifier.value = ThemeMode.light;');
    buffer.writeln('currentTheme=_themeNotifier.value;');
    buffer.writeln('toggleColor();');
    buffer.writeln('}');
    buffer.writeln('''
toSystem(context) {
    isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    _themeNotifier.value = ThemeMode.system;
    currentTheme=_themeNotifier.value;
    toggleColor();
  }
  adanceToggle({required BuildContext context, required ThemeMode mode}) {
    if (mode == ThemeMode.system) {
      isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
      _themeNotifier.value = ThemeMode.system;
    } else {
      isDark = mode == ThemeMode.dark;
      if (isDark) {
        _themeNotifier.value = ThemeMode.dark;
      } else {
        _themeNotifier.value = ThemeMode.light;
      }
    }
    currentTheme=_themeNotifier.value;
    toggleColor();
  }
  Color primary(context) => Theme.of(context).primaryColor;
  Color scaffoldBackgroundColor(context) =>
      Theme.of(context).scaffoldBackgroundColor;
  Color primaryColorScheme(context) => Theme.of(context).colorScheme.primary;
  Color secondaryColorScheme(context) =>
      Theme.of(context).colorScheme.secondary;
  Color cardColor(context) => Theme.of(context).cardColor;
  Color primaryColorDark(context) => Theme.of(context).primaryColorDark;
  Color primaryColorLight(context) => Theme.of(context).primaryColorLight;
  ThemeData theme(context) => Theme.of(context);
''');
  }
}
