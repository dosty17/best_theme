# Changelog

All notable changes to this project will be documented in this file.

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
