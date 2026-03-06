# Best Theme

<p align="center">
<img width="75%" src="https://i.pinimg.com/736x/bc/aa/f6/bcaaf6e7abcc0f4f50967c336dc2f166.jpg">
</p>

<hr>

**Best Theme** is a powerful Flutter package designed to simplify theme management within your applications. It provides an intuitive way to define and switch between light and dark modes while allowing you to add your own custom colors with seamless context-based access — powered by Flutter's native `ThemeExtension` system.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [1. Create Theme File](#1-create-theme-file-with-colors-and-class-definition)
  - [2. Wrap Your App](#2-wrap-your-app-with-classnamebesthemematerial)
  - [3. Using Custom Colors](#3-using-custom-colors)
  - [4. Customize ThemeData](#4-customize-themedata-fonts-colors-etc)
  - [5. Theme Control](#5-theme-control)
  - [6. Toggle Switch Example](#6-theme-toggle-switch-example)
  - [7. Complete Example](#7-complete-example)
  - [8. GoRouter Support](#8-gorouter-support)
- [API Reference](#api-reference)
  - [Context Extensions](#context-extensions)
- [Migration from 1.x](#migration-from-1x-old-version)
- [Contributing](#contributing)
- [About the Developer](#about-the-developer)
- [Links](#links)

## Features

- **ThemeExtension-based**: Fully integrated with Flutter's native `ThemeData.extensions` system.
- **No object needed**: Use `MyThemeMaterial` directly as your app root — no manual instantiation.
- **Custom Color Support**: Define light and dark variants for each color in one place.
- **Customizable ThemeData**: Override `buildLightTheme` / `buildDarkTheme` to set fonts, color schemes, and more.
- **Context-based Access**: Access colors and theme controls directly via `BuildContext` extensions.
- **Custom extension name**: Name your context getter via `extensionName` in the annotation.
- **GoRouter / declarative routing**: Works seamlessly with any routing solution.

## Installation

```bash
flutter pub add best_theme
flutter pub add best_theme_annotation
flutter pub add dev:best_theme_generator
dart pub add dev:build_runner
```

## Usage

### 1. Create Theme File with Colors and Class Definition

Create a theme file (e.g., `my_theme.dart`) and define your colors along with the theme class:

```dart
import 'package:best_theme/best_theme.dart';
import 'package:best_theme_annotation/best_theme_annotation.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

// Define your colors — one entry per color with light and dark variants
List<BestColor> dataColor = [
  const BestColor(name: 'primary', light: Colors.blue,      dark: Colors.indigo),
  const BestColor(name: 'text',    light: Colors.black87,   dark: Colors.white70),
  const BestColor(name: 'card',    light: Color(0xffFCFCFC),dark: Color(0xff1E1E2A)),
];

// extensionName controls the BuildContext getter: context.appColors
@BestTheme(
  vars: ['primary', 'text', 'card'],
  extensionName: 'appColors',
)
class MyTheme extends _$MyTheme {
  MyTheme() : super(myColors: dataColor);
}
```

Run code generation:

```bash
dart run build_runner build -d
```

Or watch for changes:

```bash
dart run build_runner watch -d
```

---

### 2. Wrap Your App with `MyThemeMaterial`

No object creation needed — just use the generated widget directly:

```dart
void main() {
  runApp(
    MyThemeMaterial(
      initialMode: ThemeMode.system,
      builder: (context, mode, lightTheme, darkTheme) => MaterialApp(
        title: 'My App',
        themeMode: mode,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const HomePage(),
      ),
    ),
  );
}
```

---

### 3. Using Custom Colors

Access your colors anywhere through the context using the `extensionName` you set:

```dart
Container(
  decoration: BoxDecoration(
    color: context.appColors.card,
    border: Border.all(color: context.appColors.primary),
  ),
  child: Text(
    'Hello!',
    style: TextStyle(color: context.appColors.text),
  ),
);
```

---

### 4. Customize ThemeData (fonts, colors, etc.)

Override `buildLightTheme` and/or `buildDarkTheme` in your class. The `base` parameter already has the color extension injected — just `copyWith` what you need:

```dart
@BestTheme(vars: ['primary', 'text', 'card'], extensionName: 'appColors')
class MyTheme extends _$MyTheme {
  MyTheme() : super(myColors: dataColor);

  @override
  ThemeData buildLightTheme(ThemeData base) => base.copyWith(
    fontFamily: 'Roboto',
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
    colorScheme: ColorScheme.light(primary: Colors.blue),
  );

  @override
  ThemeData buildDarkTheme(ThemeData base) => base.copyWith(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: const Color(0xFF0A1628),
    colorScheme: ColorScheme.dark(primary: Colors.indigo),
  );
}
```

---

### 5. Theme Control

Use context extensions to toggle and set the theme from anywhere in the widget tree:

```dart
// Toggle between light and dark
context.toggleTheme();

// Set a specific mode
context.setThemeMode(ThemeMode.dark);
context.toDark();
context.toLight();

// Check current state
bool isDarkMode = context.isDark;

// Access Flutter ThemeData helpers
Color bg   = context.scaffoldBackgroundColor;
Color pri  = context.primary;
Color pri2 = context.primaryScheme;
```

---

### 6. Theme Toggle Switch Example

```dart
Switch(
  value: context.isDark,
  onChanged: (_) => context.toggleTheme(),
);
```

---

### 7. Complete Example

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.appColors.primary,
        title: const Text('Best Theme Demo'),
        actions: [
          Switch(
            value: context.isDark,
            onChanged: (_) => context.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.appColors.card,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: context.appColors.primary),
              ),
              child: Text(
                'This adapts to your theme!',
                style: TextStyle(color: context.appColors.text),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.appColors.primary,
              ),
              onPressed: () => context.setThemeMode(ThemeMode.light),
              child: const Text('Switch to Light'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### 8. GoRouter Support

Works with any router — just pass `MaterialApp.router` to the builder:

```dart
final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => const HomePage()),
]);

void main() {
  runApp(
    MyThemeMaterial(
      initialMode: ThemeMode.system,
      builder: (context, mode, lightTheme, darkTheme) => MaterialApp.router(
        routerConfig: _router,
        themeMode: mode,
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    ),
  );
}
```

---

## API Reference

### Context Extensions

| Extension                             | Description                            |
| ------------------------------------- | -------------------------------------- |
| `context.{extensionName}.{colorName}` | Access any defined custom color        |
| `context.isDark`                      | `true` when current brightness is dark |
| `context.toggleTheme()`               | Toggle between light and dark          |
| `context.setThemeMode(ThemeMode)`     | Set a specific theme mode              |
| `context.toDark()`                    | Switch to dark mode                    |
| `context.toLight()`                   | Switch to light mode                   |
| `context.scaffoldBackgroundColor`     | Current scaffold background color      |
| `context.primary`                     | Current `Theme.primaryColor`           |
| `context.primaryScheme`               | Current `colorScheme.primary`          |

### `_$ClassName` Overridable Hooks

| Method                            | Description                             |
| --------------------------------- | --------------------------------------- |
| `buildLightTheme(ThemeData base)` | Override to customize light `ThemeData` |
| `buildDarkTheme(ThemeData base)`  | Override to customize dark `ThemeData`  |

---

## Migration from 1.x (old version)

> For the old 1.0.2 documentation using the singleton approach, see the
> **[1.0.2 README](https://github.com/dosty17/best_theme/blob/main/best_theme/README_0_0_3.md)**.

### App setup

**Old (1.x):**

```dart
// Needed a context wrapper method
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.BestTheme(
      materialApp: MaterialApp(...),
    );
  }
}
```

**New (2.0):**

```dart
// Standalone widget — no StatelessWidget wrapper needed
void main() {
  runApp(
    MyThemeMaterial(
      builder: (context, mode, light, dark) => MaterialApp(
        themeMode: mode,
        theme: light,
        darkTheme: dark,
        home: const HomePage(),
      ),
    ),
  );
}
```

### Color access

**Old (1.x):**

```dart
context.myColors.color1
```

**New (2.0):**

```dart
context.appColors.color1  // uses your extensionName
```

### Theme class definition

**Old (1.x):**

```dart
class MyTheme extends _$MyTheme {
  MyTheme() : super(myColors: dataColor, mode: ThemeMode.system);
}
```

**New (2.0):**

```dart
class MyTheme extends _$MyTheme {
  MyTheme() : super(myColors: dataColor);

  @override
  ThemeData buildLightTheme(ThemeData base) => base.copyWith(fontFamily: 'Roboto');
}
```

### Theme toggling

**Old (1.x):**

```dart
context.toDarkTheme();
context.toLightTheme();
context.advanceToggle(ThemeMode.dark);
```

**New (2.0):**

```dart
context.toDark();
context.toLight();
context.setThemeMode(ThemeMode.dark);
```

---

## Contributing

We welcome contributions to the Best Theme package!

1. **Report Issues**: Found a bug? [Open an issue](https://github.com/dosty17/best_theme/issues)
2. **Request Features**: Have an idea? Share it with us!

## About the Developer

This package was developed by **Dosty Pshtiwan**, a passionate Flutter developer dedicated to creating tools that make Flutter development easier and more enjoyable.

### Connect with Dosty

- 🌐 **Website**: [dostypshtiwan.com](https://www.dostypshtiwan.com/)
- 💻 **GitHub**: [github.com/dosty17](https://github.com/dosty17)
- 📺 **YouTube**: [Flutter Tutorials](https://www.youtube.com/playlist?list=PLwY2YLEPF3yAeT3r_Pdak7DO0PQbvzN_g)
- 📘 **Facebook**: [Dosty Pshtiwan](https://www.facebook.com/dosty.pshtiwan18)

## Links

- 🎥 **[YouTube Tutorials](https://www.youtube.com/playlist?list=PLwY2YLEPF3yAeT3r_Pdak7DO0PQbvzN_g)**
- 💻 **[GitHub Repository](https://github.com/dosty17)**
- 🌐 **[Official Website](https://www.dostypshtiwan.com/)**
- 📘 **[Facebook](https://www.facebook.com/dosty.pshtiwan18)**
