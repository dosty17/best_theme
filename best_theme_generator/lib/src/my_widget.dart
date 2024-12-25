class MyWidget {
  myWidget(StringBuffer buffer) {
    buffer.writeln(myWidgettxt);
  }

  var myWidgettxt = '''
 final ValueNotifier<ThemeMode> _themeNotifier =
      ValueNotifier(ThemeMode.system);

    ValueListenableBuilder BestTheme({required BuildContext context,required MaterialApp materialApp}) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: _themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
         if (_themeNotifier.value.index == ThemeMode.system.index) {
            isDark =
                MediaQuery.of(context).platformBrightness == Brightness.dark;
            toggleColor();
          }
          MaterialApp child = MaterialApp(
            actions: materialApp.actions,
            builder: materialApp.builder,
            checkerboardOffscreenLayers:
                materialApp.checkerboardOffscreenLayers,
            checkerboardRasterCacheImages:
                materialApp.checkerboardRasterCacheImages,
            color: materialApp.color,
             theme: materialApp.theme,
            darkTheme: materialApp.darkTheme ??
                ThemeData.dark().copyWith(
                  colorScheme: materialApp.theme?.colorScheme,
                ),
            debugShowCheckedModeBanner: materialApp.debugShowCheckedModeBanner,
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
            useInheritedMediaQuery: materialApp.useInheritedMediaQuery,
            
          );

          return child;
        });
  }
''';
}
