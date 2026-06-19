# Best Theme

<p align="center">
  <img width="75%" src="https://i.pinimg.com/736x/bc/aa/f6/bcaaf6e7abcc0f4f50967c336dc2f166.jpg">
</p>

---

**Best Theme** is a powerful Flutter package designed to simplify theme management within your applications. It provides an intuitive way to define and switch between light and dark modes while allowing you to add your own custom colors, text styles, and assets with seamless context-based access — powered by Flutter's native `ThemeExtension` system and static code generation.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [1. Create Theme Class](#1-create-theme-file-with-tokens-and-class-definition)
  - [2. Storage Adapter Caching (Optional)](#2-persistent-storage-adapter-optional)
  - [3. Wrap Your App](#3-wrap-your-app-with-mythemematerial)
  - [4. Access Design Tokens Inline](#4-using-custom-design-tokens)
  - [5. Customize ThemeData](#5-customize-themedata-fonts-colors-etc)
  - [6. Theme Control](#6-theme-control)
  - [7. Toggle Switch Example](#7-theme-toggle-switch-example)
  - [8. GoRouter Support](#8-gorouter-support)

- [API Reference](#api-reference)
- [Migration from 2.0.0](#migration-from-200-to-300-breaking-changes)
- [Contributing](#contributing)
- [About the Developer](#about-the-developer)
- [Links](#links)

## Features

- ✅ Built on Flutter's native `ThemeExtension` system
- ✅ Static code generation
- ✅ Light & Dark theme support
- ✅ Type-safe custom colors
- ✅ Type-safe text styles
- ✅ Type-safe assets
- ✅ Persistent theme storage support
- ✅ Context-based access
- ✅ Easy theme switching
- ✅ Supports custom ThemeData configuration
- ✅ Zero runtime token parsing

## Installation

Add the required packages:

```bash
flutter pub add best_theme
flutter pub add best_theme_annotation
dart pub add dev:best_theme_generator
dart pub add dev:build_runner
```

Then run:

```bash
flutter pub get
```

## Usage

### 1. Create Theme File with Tokens and Class Definition

Create a theme file (for example `my_theme.dart`):

```dart
import 'package:best_theme/best_theme.dart';
import 'package:best_theme_annotation/best_theme_annotation.dart';
import 'package:flutter/material.dart';

part 'my_theme.g.dart';

@BestTheme(extensionName: 'appTheme')
class MyTheme extends _$MyTheme {

  static const primary = BestColor(
    light: Colors.blue,
    dark: Colors.indigo,
  );

  static const card = BestColor(
    light: Color(0xffFCFCFC),
    dark: Color(0xff1E1E2A),
  );

  static const titleLarge = BestTextStyle(
    light: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    dark: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static const appLogo = BestAsset(
    light: 'assets/images/logo_light.png',
    dark: 'assets/images/logo_dark.png',
  );
}
```

Generate the code:

```bash
dart run build_runner build -d
```

For continuous generation:

```bash
dart run build_runner watch -d
```

---

### 2. Persistent Storage Adapter (Optional)

To automatically save and restore the selected theme mode:

```dart
import 'package:best_theme/best_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefThemeStorage implements BestThemeStorage {
  static const _key = 'theme_mode_index';

  @override
  Future<ThemeMode?> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_key);

    return index != null
        ? ThemeMode.values[index]
        : null;
  }

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, mode.index);
  }
}
```

---

### 3. Wrap Your App with MyThemeMaterial

```dart
void main() {
  runApp(
    MyThemeMaterial(
      initialMode: ThemeMode.system,
      storage: SharedPrefThemeStorage(),
      builder: (
        context,
        mode,
        lightTheme,
        darkTheme,
      ) {
        return MaterialApp(
          title: 'My App',
          themeMode: mode,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const HomePage(),
        );
      },
    ),
  );
}
```

---

### 4. Using Custom Design Tokens

Access your colors, text styles, and assets using the generated context extension:

```dart
Container(
  decoration: BoxDecoration(
    color: context.appTheme.card,
    border: Border.all(
      color: context.appTheme.primary,
    ),
  ),
  child: Column(
    children: [
      Image.asset(
        context.appTheme.appLogo,
      ),
      Text(
        'Hello World!',
        style: context.appTheme.titleLarge,
      ),
    ],
  ),
);
```

---

### 5. Customize ThemeData (Fonts, Colors, Components, etc.)

Override the generated theme builders:

```dart
@BestTheme(extensionName: 'appTheme')
class MyTheme extends _$MyTheme {

  static const primary = BestColor(
    light: Colors.blue,
    dark: Colors.indigo,
  );

  @override
  ThemeData buildLightTheme(ThemeData base) {
    return base.copyWith(
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
      ),
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
      ),
    );
  }

  @override
  ThemeData buildDarkTheme(ThemeData base) {
    return base.copyWith(
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: const Color(0xFF0A1628),
      colorScheme: ColorScheme.dark(
        primary: Colors.indigo,
      ),
    );
  }
}
```

Generated extensions are automatically merged into `ThemeData.extensions`.

---

### 6. Theme Control

Toggle between themes:

```dart
context.toggleTheme();
```

Set a specific mode:

```dart
context.setThemeMode(ThemeMode.dark);
context.setThemeMode(ThemeMode.light);
context.setThemeMode(ThemeMode.system);
```

Shortcuts:

```dart
context.toDark();
context.toLight();
```

Check current state:

```dart
bool isDarkMode = context.isDark;
```

Access common ThemeData properties:

```dart
Color background = context.scaffoldBackgroundColor;
Color primary = context.primary;
```

---

### 7. Theme Toggle Switch Example

```dart
Switch(
  value: context.isDark,
  onChanged: (_) {
    context.toggleTheme();
  },
)
```

---

### 8. GoRouter Support

```dart
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
    ),
  ],
);

void main() {
  runApp(
    MyThemeMaterial(
      initialMode: ThemeMode.system,
      builder: (
        context,
        mode,
        lightTheme,
        darkTheme,
      ) {
        return MaterialApp.router(
          routerConfig: router,
          themeMode: mode,
          theme: lightTheme,
          darkTheme: darkTheme,
        );
      },
    ),
  );
}
```

---

## API Reference

### Context Extensions

| Extension                             | Description                                  |
| ------------------------------------- | -------------------------------------------- |
| `context.{extensionName}.{fieldName}` | Access generated color, text style, or asset |
| `context.isDark`                      | Returns true when current theme is dark      |
| `context.toggleTheme()`               | Toggle between light and dark modes          |
| `context.setThemeMode(mode)`          | Set a specific ThemeMode                     |
| `context.toDark()`                    | Switch to dark mode                          |
| `context.toLight()`                   | Switch to light mode                         |
| `context.primary`                     | Access ThemeData primary color               |
| `context.scaffoldBackgroundColor`     | Access scaffold background color             |

---

## Migration from 2.0.0 to 3.0.0 (Breaking Changes)

Version 3.0.0 introduces a fully static approach for better performance, cleaner code generation, and improved type safety.

> For the old 2.0.0 documentation, see the
> **[2.0.0 README](https://github.com/dosty17/best_theme/blob/main/best_theme/README_2_0_0.md)**.

### Changes Checklist

#### Remove `vars`

Old:

```dart
@BestTheme(
  vars: ['primary'],
  extensionName: 'appColors',
)
class MyTheme extends _$MyTheme {}
```

New:

```dart
@BestTheme(
  extensionName: 'appColors',
)
class MyTheme extends _$MyTheme {
  static const primary = BestColor(
    light: Colors.blue,
    dark: Colors.indigo,
  );
}
```

---

#### Remove Runtime Constructors

Old:

```dart
List<BestColor> dataColor = [
  const BestColor(
    name: 'primary',
    light: Colors.blue,
    dark: Colors.indigo,
  ),
];

class MyTheme extends _$MyTheme {
  MyTheme() : super(
    myColors: dataColor,
  );
}
```

New:

```dart
class MyTheme extends _$MyTheme {
  static const primary = BestColor(
    light: Colors.blue,
    dark: Colors.indigo,
  );
}
```

---

#### Declare Tokens as Static Constants

Old:

```dart
final primary = BestColor(
  light: Colors.blue,
  dark: Colors.indigo,
);
```

New:

```dart
static const primary = BestColor(
  light: Colors.blue,
  dark: Colors.indigo,
);
```

---

## Contributing

Contributions are welcome and appreciated.

### Report Issues

Open an issue if you find a bug or unexpected behavior.

### Request Features

Have an idea for improvement? Create a feature request and share it with the community.

### Submit Pull Requests

Pull requests are always welcome.

---

## About the Developer

Developed by **Dosty Pshtiwan** — a passionate Full-Stack Software Developer focused on building tools that improve developer productivity and Flutter development experience.

### Connect

- 🌐 Website: https://dostypshtiwan.com
- 💻 GitHub: https://github.com/dosty17
- 📺 YouTube: Flutter Tutorials
- 📘 Facebook: Dosty Pshtiwan

---

## Links

- 🎥 YouTube Tutorials
- 💻 GitHub Repository
- 🌐 Official Website

---
