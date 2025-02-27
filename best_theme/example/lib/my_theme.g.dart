// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme.dart';

// **************************************************************************
// BestGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names
// **************************************************************************

// Custom code generated by: Dosty Pshtiwan
// ********************************************************
// This is a custom generator for handling theme colors
// Generated for: Mytheme

class _$Mytheme {
  late List<BestColor> myColors;
  final Map<String, Map<String, Color>> _colors = {};
  bool isDark = false;
  late Color color1;
  late Color color2;
  late Color color3;
  late Color color4;
  late Color grey23;
  late Color grey3;
  List<ThemeMode> typeOfThemes = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark
  ];
  ThemeMode currentTheme = ThemeMode.system;
  ThemeParam get colors => _themeNotifier.value;

  late final ValueNotifier<ThemeParam> _themeNotifier;

  _$Mytheme({List<BestColor>? myColors, ThemeMode mode = ThemeMode.system}) {
    if (myColors != null) {
      for (var color in myColors) {
        _colors[color.name] = color.toMap();
      }
    }
    color1 = _colors['color1']![isDark ? 'dark' : 'light']!;
    color2 = _colors['color2']![isDark ? 'dark' : 'light']!;
    color3 = _colors['color3']![isDark ? 'dark' : 'light']!;
    color4 = _colors['color4']![isDark ? 'dark' : 'light']!;
    grey23 = _colors['grey23']![isDark ? 'dark' : 'light']!;
    grey3 = _colors['grey3']![isDark ? 'dark' : 'light']!;
    if (myColors != null) {
      this.myColors = myColors;
    }
    isDark = mode == ThemeMode.dark;
    _themeNotifier = ValueNotifier(ThemeParam(mode, this.myColors, isDark));
  }
  ValueListenableBuilder BestTheme({
    required BuildContext context,
    required MaterialApp materialApp,
    bool useRouterConfig = false,
  }) {
    return ValueListenableBuilder<ThemeParam>(
      valueListenable: _themeNotifier,
      builder: (_, ThemeParam param, __) {
        var currentMode = param.mode;
        if (_themeNotifier.value.mode.index == ThemeMode.system.index) {
          isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
          _themeNotifier.value = ThemeParam(ThemeMode.system, myColors, isDark);
        }
        return useRouterConfig
            ? MaterialApp.router(
                routerConfig: materialApp.routerConfig,
                builder: materialApp.builder,
                checkerboardOffscreenLayers:
                    materialApp.checkerboardOffscreenLayers,
                checkerboardRasterCacheImages:
                    materialApp.checkerboardRasterCacheImages,
                color: materialApp.color,
                theme: materialApp.theme,
                darkTheme: materialApp.darkTheme ??
                    ThemeData.dark()
                        .copyWith(colorScheme: materialApp.theme?.colorScheme),
                debugShowCheckedModeBanner:
                    materialApp.debugShowCheckedModeBanner,
                debugShowMaterialGrid: materialApp.debugShowMaterialGrid,
                highContrastDarkTheme: materialApp.highContrastDarkTheme,
                highContrastTheme: materialApp.highContrastTheme,
                locale: materialApp.locale,
                key: materialApp.key,
                localeListResolutionCallback:
                    materialApp.localeListResolutionCallback,
                title: materialApp.title,
                themeMode: currentMode,
                localeResolutionCallback: materialApp.localeResolutionCallback,
                localizationsDelegates: materialApp.localizationsDelegates,
                restorationScopeId: materialApp.restorationScopeId,
                scrollBehavior: materialApp.scrollBehavior,
                supportedLocales: materialApp.supportedLocales,
                themeAnimationCurve: materialApp.themeAnimationCurve,
                themeAnimationDuration: materialApp.themeAnimationDuration,
                themeAnimationStyle: materialApp.themeAnimationStyle,
              )
            : MaterialApp(
                actions: materialApp.actions,
                builder: materialApp.builder,
                checkerboardOffscreenLayers:
                    materialApp.checkerboardOffscreenLayers,
                checkerboardRasterCacheImages:
                    materialApp.checkerboardRasterCacheImages,
                color: materialApp.color,
                theme: materialApp.theme,
                darkTheme: materialApp.darkTheme ??
                    ThemeData.dark()
                        .copyWith(colorScheme: materialApp.theme?.colorScheme),
                debugShowCheckedModeBanner:
                    materialApp.debugShowCheckedModeBanner,
                debugShowMaterialGrid: materialApp.debugShowMaterialGrid,
                highContrastDarkTheme: materialApp.highContrastDarkTheme,
                highContrastTheme: materialApp.highContrastTheme,
                home: materialApp.home,
                initialRoute: materialApp.initialRoute,
                locale: materialApp.locale,
                key: materialApp.key,
                localeListResolutionCallback:
                    materialApp.localeListResolutionCallback,
                title: materialApp.title,
                themeMode: currentMode,
                localeResolutionCallback: materialApp.localeResolutionCallback,
                localizationsDelegates: materialApp.localizationsDelegates,
                navigatorKey: materialApp.navigatorKey,
                navigatorObservers: materialApp.navigatorObservers ?? [],
                onGenerateInitialRoutes: materialApp.onGenerateInitialRoutes,
                onGenerateRoute: materialApp.onGenerateRoute,
                onGenerateTitle: materialApp.onGenerateTitle,
                onNavigationNotification: materialApp.onNavigationNotification,
                onUnknownRoute: materialApp.onUnknownRoute,
                restorationScopeId: materialApp.restorationScopeId,
                routes: materialApp.routes ?? {},
                scaffoldMessengerKey: materialApp.scaffoldMessengerKey,
                scrollBehavior: materialApp.scrollBehavior,
                shortcuts: materialApp.shortcuts,
                showPerformanceOverlay: materialApp.showPerformanceOverlay,
                showSemanticsDebugger: materialApp.showSemanticsDebugger,
                supportedLocales: materialApp.supportedLocales,
                themeAnimationCurve: materialApp.themeAnimationCurve,
                themeAnimationDuration: materialApp.themeAnimationDuration,
                themeAnimationStyle: materialApp.themeAnimationStyle,
              );
      },
    );
  }

  void toggle() {
    isDark = !isDark;
    toggleColor();
    _themeNotifier.value =
        ThemeParam(isDark ? ThemeMode.dark : ThemeMode.light, myColors, isDark);
    currentTheme = _themeNotifier.value.mode;
  }

  void toDark() {
    isDark = true;
    toggleColor();
    _themeNotifier.value = ThemeParam(ThemeMode.dark, myColors, true);
    currentTheme = _themeNotifier.value.mode;
  }

  void toLight() {
    isDark = false;
    toggleColor();
    _themeNotifier.value = ThemeParam(ThemeMode.light, myColors, false);
    currentTheme = _themeNotifier.value.mode;
  }

  void toSystem(BuildContext context) {
    isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    toggleColor();
    _themeNotifier.value = ThemeParam(ThemeMode.system, myColors, isDark);
    currentTheme = _themeNotifier.value.mode;
  }

  adanceToggle({required BuildContext context, required ThemeMode mode}) {
    if (mode == ThemeMode.system) {
      isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
      _themeNotifier.value.mode = ThemeMode.system;
    } else {
      isDark = mode == ThemeMode.dark;
    }
    toggleColor();
    _themeNotifier.value = ThemeParam(mode, myColors, isDark);
    currentTheme = _themeNotifier.value.mode;
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

  toggleColor() {
    color1 = _colors['color1']![isDark ? 'dark' : 'light']!;
    color2 = _colors['color2']![isDark ? 'dark' : 'light']!;
    color3 = _colors['color3']![isDark ? 'dark' : 'light']!;
    color4 = _colors['color4']![isDark ? 'dark' : 'light']!;
    grey23 = _colors['grey23']![isDark ? 'dark' : 'light']!;
    grey3 = _colors['grey3']![isDark ? 'dark' : 'light']!;
  }

  Widget BestThemeBuilder({
    required Widget Function(ThemeParam theme, BuildContext context) builder,
  }) {
    return ValueListenableBuilder<ThemeParam>(
      valueListenable: _themeNotifier,
      builder: (context, themeParam, _) => builder(themeParam, context),
    );
  }
}

class ThemeParam {
  late ThemeMode mode;
  final Map<String, Map<String, Color>> _colors = {};
  late Color color1;
  late Color color2;
  late Color color3;
  late Color color4;
  late Color grey23;
  late Color grey3;
  ThemeParam(this.mode, List<BestColor> myColors, bool isDark) {
    for (var color in myColors) {
      _colors[color.name] = color.toMap();
    }
    color1 = _colors['color1']![isDark ? 'dark' : 'light']!;
    color2 = _colors['color2']![isDark ? 'dark' : 'light']!;
    color3 = _colors['color3']![isDark ? 'dark' : 'light']!;
    color4 = _colors['color4']![isDark ? 'dark' : 'light']!;
    grey23 = _colors['grey23']![isDark ? 'dark' : 'light']!;
    grey3 = _colors['grey3']![isDark ? 'dark' : 'light']!;
  }
}
