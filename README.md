# Best Theme

<p align="center">
<img width="75%" src="https://i.pinimg.com/736x/bc/aa/f6/bcaaf6e7abcc0f4f50967c336dc2f166.jpg">
</p>

<hr>

**Best Theme** is a powerful Flutter package designed to simplify theme management within your applications. It provides an intuitive way to define and switch between light and dark modes while allowing you to add your own custom colors.

## Features

- **Easy Theme Management**: Effortlessly manage themes for your Flutter application.
- **Custom Color Support**: Add your own colors with defined light and dark variations.
- **Theme Mode Toggling**: Easily toggle between different theme modes, including System, Light, and Dark.
- **Streamlined Integration**: Quickly integrate with your existing Flutter projects.
- **support go router**

## Installation

To install the Best Theme package, run the following commands in your terminal:

```bash
flutter pub add best_theme
flutter pub add best_theme_annotation
dart pub add best_theme_generator
dart pub add dev:build_runner
```

## Usage

1. **Create a Theme Class**  
    Define a class for your theme that extends from the generated class. The class name should match the desired theme name.
```
import 'package:best_theme/best_theme.dart';
import 'package:best_theme_annotation/best_theme_annotation.dart';
import 'package:flutter/material.dart';

part 'filename.g.dart';

@BestTheme
class MyTheme extends _$MyTheme {
}
```
after run `dart run build_runner build` or `dart run build_runner watch` or `dart run build_runner watch --delete-conflicting-outputs`


2. **Define Your Colors**
    Create a list of colors using the BestColor class, specifying the light and dark variants.
```
List<BestColor> data = [
  BestColor(name: 'color1', light: Colors.white, dark: Colors.black),
  BestColor(name: 'color2', light: Colors.black, dark: Colors.white),
  BestColor(name: 'color3', light: Colors.amber, dark: Colors.red),
  BestColor(name: 'color4', light: Colors.amber, dark: Colors.red),
  BestColor(name: 'grey2', light: Colors.grey, dark: Colors.blueGrey),
  BestColor(name: 'grey3', light: Colors.grey, dark: Colors.blueGrey),
];

```

3. **Annotate Your Theme Class**
Use the @BestTheme annotation to define the variables for your theme.
```
@BestTheme(vars: [
  'color1',
  'color2',
  'color3',
  'color4',
  'grey2',
  'grey3',
])
class MyTheme extends _$MyTheme {
  MyTheme() : super(myColors: data, mode: ThemeMode.dark);
}

```

**Full code**
```dart
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
```


4. **Create an object in main file**
```
MyTheme myTheme = MyTheme();
void main() {
  runApp(const MyApp());
}
```


5. **Wrap your child of MyApp with BestTheme** you can use myTheme.BestTheme():
```

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return myTheme.BestTheme(
      context: context,
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
  


6. **Using Your custom Colors**
You can now use your defined colors throughout your app, but need wrap with BestThemeBuilder like below code:<br>
A- if you want to use for all widgets of a class, wrap scaffold with BestThemeBuilder like that:

```
  mytheme.BestThemeBuilder(
    builder: (theme, context) {
      return Scaffold(
        //add your code
      );
    },
  );
```
and use colors through `theme` for example: `theme.color3;`
<br>
<br>
B-you can wrap just some widgets:

```
 mytheme.BestThemeBuilder(
    builder: (theme, context) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: theme.grey3),
        child: const Text('example'),
      );
    },
  );
```
<br>
<span style="color:goldenrod">Warning:</span> once the theme changes, all widgets that are in BestThemeBuilder will be refreshed.
<br>
<br>
For a shorter method of accessing some colors within ThemeData:

```
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(color: myTheme.primary(context)),
  child: Text('Example'),
);

```

7. **Toggle Theme**
You can easily toggle the theme mode using a switch:
```
Switch(
  value: myTheme.isDark,
  onChanged: (value) {
    myTheme.toggle();
  },
);

```

8. **How to set custom font?**
```
myTh.BestTheme(
  context: context,
  materialApp: MaterialApp(
    title: 'Dosty',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: myTheme.main),
      scaffoldBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
      useMaterial3: true,
      fontFamily: 'kurdish',
    ),
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: myTheme.main),
      scaffoldBackgroundColor: const Color(0xff111015),
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'kurdish'),
    ),
    home: const BottomNavigation(),
  ));
```

9. **You can access custom colors**
<br> You can access custom colors without BestThemeBuilder instead through mytheme object example:
```dart
Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(color: mytheme.colors.color1),
    child: const Text('example'),
  );
```
<span style="color:goldenrod">Warning:</span> dont use color through this way if you want to change with toggle theme at real time
<br>

10. **You can use go router**
<br>
set useRouterConfig to true in mytheme.BestTheme() Widget :
`
  mytheme.BestTheme(
    context: context,
    useRouterConfig: true,
  );
`


## Variables

| Variables                               | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `isDark`                                | Check is current mode is dark                    |
| `typeOfThemes`                          | return all type of theme mode                    |
| `currentTheme`                          | return current theme mode                        |
| `colors`                                | return all colors                                |

## Additional Methods

| Method                                  | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `toggle();`                             | toggle theme                                     |
| `toSystem(context);`                    | Switch to system theme                           |
| `toLight();`                            | Switch to light theme                            |
| `toDark();`                             | Switch to dark theme                             |
| `advanceToggle(context: context, mode: ThemeMode.?);` | Advanced toggle with specified mode             |

**Short Methods**

| Method                                  | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `theme(context)`                        | Get the current theme context                    |
| `primary(context)`                      | Access the primary color                         |
| `scaffoldBackgroundColor(context)`      | Access the scaffold background color          |
| `primaryColorScheme(context)`           | Access the primary color scheme                  |
| `secondaryColorScheme(context)`         | Access the secondary color scheme                |
| `cardColor(context)`                    | Access the card color                            |
| `primaryColorDark(context)`             | Access the primary dark color                    |
| `primaryColorLight(context)`            | Access the primary light color                   |

## About the developer
This package was developed by Dosty Pshtiwan.



## Links:
[documentattion](https://fersaz.com/flutter/best_theme)\
[youtube](https://www.youtube.com/playlist?list=PLwY2YLEPF3yAeT3r_Pdak7DO0PQbvzN_g)\
[facebook](https://www.facebook.com/dosty.pshtiwan18)


