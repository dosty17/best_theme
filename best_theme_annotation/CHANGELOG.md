# Changelog

All notable changes to this project will be documented in this file.

## [2.0.0] - 2026-06-19

### Breaking Changes

- Removed the `vars` parameter from the `@BestTheme` annotation.
- The generator now automatically discovers theme tokens using compile-time static field analysis.
- Manual variable registration is no longer required.

### Added

- Support for automatic generation of:
  - `BestColor`
  - `BestTextStyle`
  - `BestAsset`

- Improved compile-time performance.
- Cleaner and more maintainable theme definitions.
- Stronger type safety through static token discovery.

### Migration Guide

Remove the `vars` parameter from your annotation and define your theme tokens as `static const` fields inside the theme class.

#### Old (v1.x.x)

```dart
@BestTheme(
  vars: ['primary', 'card'],
  extensionName: 'myColors',
)
class MyTheme extends _$MyTheme {}
```

#### New (v2.0.0)

```dart
@BestTheme(
  extensionName: 'myColors',
)
class MyTheme extends _$MyTheme {
  static const primary = BestColor(
    light: Colors.blue,
    dark: Colors.indigo,
  );

  static const card = BestColor(
    light: Colors.white,
    dark: Colors.black,
  );
}
```

---

## [1.0.0] - 2026-03-06

### Added

- Added `extensionName` parameter to `@BestTheme` annotation (default: `'bestTheme'`).
  Allows customizing the `BuildContext` getter name generated for accessing theme colors.
  Example: `@BestTheme(vars: [...], extensionName: 'appColors')` → `context.appColors.color1`.

### Changed

- `@BestTheme` annotation now requires the companion `best_theme_generator` `2.0.0` which
  generates a `ThemeExtension`-based class instead of the previous singleton approach.
- Generated code now uses Flutter's `ThemeExtension` system (`ThemeData.extensions`) for
  proper light/dark theme integration with `MaterialApp`.
- Replaced the old `ThemeMode`-based singleton pattern with `buildLightTheme` / `buildDarkTheme`
  overridable hooks on the generated base class, allowing full `ThemeData` customization.

## [0.0.1] - 2024-10-31

### Added

- Initial release of `best_theme_annotation` package.
- `@BestTheme` annotation to define custom theme colors and modes.
- Support for defining color variables that can be automatically generated with `best_theme_generator`.
- Ability to specify light and dark color values for each `DostyColor`.
- Flexible theme configuration with easy integration into theme management setups.

### Fixed

- N/A (First release)

### Changed

- N/A (First release)
