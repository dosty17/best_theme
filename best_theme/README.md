# Best Theme

<p align="center">
<img width="75%" src="https://i.pinimg.com/736x/bc/aa/f6/bcaaf6e7abcc0f4f50967c336dc2f166.jpg">
</p>

<hr>

**Best Theme** is a powerful Flutter package designed to simplify theme management within your applications. It provides an intuitive way to define and switch between light and dark modes while allowing you to add your own custom colors with seamless context-based access.
ac
## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Create Theme File](#1-create-theme-file-with-colors-and-class-definition)
  - [Wrap Your App](#2-wrap-your-app-with-besttheme)
  - [Using Custom Colors](#3-using-custom-colors)
  - [Theme Control](#4-theme-control)
  - [Theme Toggle Switch](#5-theme-toggle-switch-example)
  - [Complete Example](#6-complete-example-with-custom-colors)
  - [Custom Font Support](#7-custom-font-support)
  - [GoRouter Support](#8-gorouter-support)
- [API Reference](#api-reference)
  - [Context Extensions](#context-extensions)
  - [Available Properties](#available-properties)
  - [Additional Methods](#additional-methods)
  - [Short Methods for Theme Colors](#short-methods-for-theme-colors)
- [Migration Guide](#migration-from-previous-version)
- [Examples](#examples)
- [Contributing](#contributing)
- [About the Developer](#about-the-developer)
- [Links](#links)

## Features

- **Easy Theme Management**: Effortlessly manage themes for your Flutter application.
- **Custom Color Support**: Add your own colors with defined light and dark variations.
- **Theme Mode Toggling**: Easily toggle between different theme modes, including System, Light, and Dark.
- **Context-based Access**: Access colors and theme functions directly through BuildContext extensions.
- **GoRouter Support**: Full support for declarative routing solutions like GoRouter.
- **Automatic Theme Switching**: Seamless theme switching with real-time updates.

## Installation

To install the Best Theme package, run the following commands in your terminal:

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

// Define your colors first
List<BestColor> dataColor = [
  const BestColor(name: 'primary', light: Colors.blue, dark: Colors.indigo),
  const BestColor(name: 'text', light: Colors.black87, dark: Colors.white70),
  const BestColor(name: 'color1', light: Color(0xffFCB949), dark: Color(0xffEBED6B)),
  const BestColor(name: 'color2', light: Color(0xff10161C), dark: Colors.white),
];

// Create theme class with vars based on your defined colors
@BestTheme(vars: [
  'primary',
  'text',
  'color1',
  'color2',
])
class MyTheme extends _$MyTheme {
  MyTheme() : super(myColors: dataColor, mode: ThemeMode.system);
}
```

After creating your theme file, run the code generation:

```bash
dart run build_runner build
```
or for continuous generation
```bash
dart run build_runner watch
```
or to resolve conflicts
```bash
dart run build_runner watch -d
```

### 2. Wrap Your App with BestTheme

Use the context to wrap your app with BestTheme:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return context.BestTheme(
      materialApp: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
```

### 3. Using Custom Colors

Access your custom colors directly through the context:

```dart
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    color: context.myColors.primary,
    border: Border.all(color: context.myColors.color1),
  ),
  child: Text(
    'Example',
    style: TextStyle(color: context.myColors.text),
  ),
);
```

All your defined colors are available through `context.myColors.[colorName]`:
- `context.myColors.primary`
- `context.myColors.text`
- `context.myColors.color1`
- `context.myColors.color2`

### 4. Theme Control

Toggle and control themes using context extensions:

```dart
// Toggle between light and dark
context.toggleTheme();

// Set specific theme modes
context.toDarkTheme();
context.toLightTheme();
context.toSystemTheme();

// Advanced toggle with specific mode
context.advanceToggle(ThemeMode.dark);

// Check current theme state
bool isDarkMode = context.isDark;
```

### 5. Theme Toggle Switch Example

```dart
Switch(
  value: context.isDark,
  onChanged: (value) {
    context.toggleTheme();
  },
);
```

### 6. Complete Example with Custom Colors

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.myColors.primary,
        title: Text(
          'Best Theme Demo',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Switch(
            value: context.isDark,
            onChanged: (value) => context.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.myColors.color1,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: context.myColors.color2),
              ),
              child: Text(
                'This container adapts to your theme!',
                style: TextStyle(color: context.myColors.text),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.myColors.color1,
              ),
              onPressed: () {},
              child: Text('Accent Button'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 7. Custom Font Support

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.BestTheme(
      materialApp: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: context.myColors.primary),
          scaffoldBackgroundColor: context.myColors.background,
          useMaterial3: true,
          fontFamily: 'MyCustomFont',
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: context.myColors.primary),
          scaffoldBackgroundColor: context.myColors.background,
          textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'MyCustomFont'),
        ),
        home: const HomePage(),
      ),
    );
  }
}
```

### 8. GoRouter Support

For apps using GoRouter or other declarative routing solutions:

```dart
class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return context.BestThemeRouter(
      materialApp: MaterialApp.router(
        routerConfig: router,
        title: 'My App with GoRouter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: context.myColors.primary),
          useMaterial3: true,
        ),
      ),
    );
  }
}
```

## API Reference

### Context Extensions

| Extension Method                        | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `context.myColors.[colorName]`          | Access any defined custom color                  |
| `context.isDark`                        | Check if current mode is dark                    |
| `context.toggleTheme()`                 | Toggle between light and dark themes            |
| `context.toDarkTheme()`                 | Switch to dark theme                             |
| `context.toLightTheme()`                | Switch to light theme                            |
| `context.toSystemTheme()`               | Switch to system theme                           |
| `context.advanceToggle(ThemeMode mode)` | Advanced toggle with specified mode              |
| `context.BestTheme(materialApp: ...)`   | Wrap app with BestTheme                          |
| `context.BestThemeRouter(materialApp: ...)`| Wrap router app with BestTheme               |

### Available Properties

Access these properties through the generated instance:

| Property                                | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `isDark`                                | Check if current mode is dark                    |
| `typeOfThemes`                          | Return all theme mode types                      |
| `currentTheme`                          | Return current theme mode                        |
| `myColors`                              | Return all defined colors                        |

### Additional Methods

| Method                                  | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `toggle()`                              | Toggle theme                                     |
| `toSystem(context)`                     | Switch to system theme                           |
| `toLight()`                             | Switch to light theme                            |
| `toDark()`                              | Switch to dark theme                             |
| `adanceToggle(context: context, mode: ThemeMode.?)` | Advanced toggle with specified mode     |

### Short Methods for Theme Colors

| Method                                  | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `theme(context)`                        | Get the current theme context                    |
| `primaryColor(context)`                 | Access the primary color                         |
| `scaffoldBackgroundColor(context)`      | Access the scaffold background color             |
| `primaryColorScheme(context)`           | Access the primary color scheme                  |
| `secondaryColorScheme(context)`         | Access the secondary color scheme                |
| `cardColor(context)`                    | Access the card color                            |
| `primaryColorDark(context)`             | Access the primary dark color                    |
| `primaryColorLight(context)`            | Access the primary light color                   |

## Migration from Previous Version

If you're migrating from the previous version:

### Access to Colors

**Old way:**
```dart
myTheme.BestThemeBuilder(
  builder: (theme, context) {
    return Container(
      color: theme.color1,
      child: Text('Example'),
    );
  },
);
```

**New way:**
```dart
Container(
  color: context.myColors.color1,
  child: Text('Example'),
);
```

### Toggle Theme

**Old way:**
<br>
First need to create an object from MyTheme like:
```dart
MyTheme myTheme = MyTheme();
```
```dart
Switch(
  value: myTheme.isDark,
  onChanged: (value) {
    myTheme.toggle();
  },
);
```

**New way:**
<br>
```dart
Switch(
  value: context.isDark,
  onChanged: (value) {
    context.toggleTheme();
  },
);
```

The new version eliminates the need for `BestThemeBuilder` wrapper and provides direct access through context extensions and an object from MyTheme.
[Old Documentation 0.0.3](https://github.com/dosty17/best_theme/blob/main/best_theme/README_0_0_3.md)

## Contributing

We welcome contributions to the Best Theme package! Here's how you can help:

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

- 🎥 **[YouTube Tutorials](https://www.youtube.com/playlist?list=PLwY2YLEPF3yAeT3r_Pdak7DO0PQbvzN_g)**: Video tutorials and examples
- 💻 **[GitHub Repository](https://github.com/dosty17)**: Source code and issue tracker
- 🌐 **[Official Website](https://www.dostypshtiwan.com/)**: Developer's official website
- 📘 **[Facebook](https://www.facebook.com/dosty.pshtiwan18)**: Follow for updates and community

---

**Made with ❤️ by [Dosty Pshtiwan](https://www.dostypshtiwan.com/)**

*If you find this package helpful, please consider giving it a ⭐ on [GitHub](https://github.com/dosty17)!*