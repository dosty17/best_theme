# Changelog

All notable changes to this project will be documented in this file.

## [3.0.5] - 2026-06-19

### Fixed

- Fix some problems

## [3.0.1] - 2026-06-19

### Fixed

-A bug fixed

## [3.0.0] - 2026-06-19

### Breaking Changes

- Migrated the code generation engine to parse theme tokens directly from `static const` class fields.
- Removed the legacy annotation-driven variable collection mechanism.
- Removed internal runtime parameter maps and array-based token registration.
- Eliminated factory constructors that relied on dynamic token arrays.
- Reduced runtime allocations and removed lookup-related null reference issues.

### Added

- Automatic detection and generation of:
  - `BestColor`
  - `BestTextStyle`
  - `BestAsset`

- Multi-token grouping support for colors, typography, and assets.
- Asynchronous storage lifecycle support through `BestThemeStorage`.
- Automatic theme mode persistence integration.
- Improved generated state management architecture.
- Safe extension bundling after custom theme overrides.
- Generated extensions are now appended after `buildLightTheme()` and `buildDarkTheme()` execution, preventing accidental loss of generated theme extensions.
- Improved compile-time performance and code generation reliability.

### Fixed

- Full compatibility with Analyzer 6.x and 7.x.
- Fixed AST scanning issues caused by analyzer API changes.
- Fixed build failures related to the `fields2` architecture migration.
- Improved generator stability across newer Dart SDK versions.

### Migration Guide

#### Old (v2.x.x)

```dart
final colors = [
  BestColor(
    name: 'primary',
    light: Colors.blue,
    dark: Colors.indigo,
  ),
];

class MyTheme extends _$MyTheme {
  MyTheme() : super(myColors: colors);
}
```

#### New (v3.0.0)

```dart
@BestTheme(
  extensionName: 'appTheme',
)
class MyTheme extends _$MyTheme {
  static const primary = BestColor(
    light: Colors.blue,
    dark: Colors.indigo,
  );

  static const titleLarge = BestTextStyle(
    light: TextStyle(fontSize: 24),
    dark: TextStyle(fontSize: 24),
  );

  static const appLogo = BestAsset(
    light: 'assets/logo_light.png',
    dark: 'assets/logo_dark.png',
  );
}
```

---

## [2.0.0] - 2026-03-06

### Breaking Changes

- **Complete architecture redesign**: Generator now produces a `ThemeExtension`-based class
  (`_${ClassName}Theme extends ThemeExtension`) instead of the previous singleton pattern.
  Generated code is no longer compatible with `1.x` usage.
- **Removed**: singleton (`init()`, `instance`), `ValueNotifier`/`ThemeParam`, `BestThemeProvider`,
  `BestThemeBuilder`, static color getters, and the `context.BestTheme()` / `context.BestThemeRouter()` wrappers.
- **Removed**: `toggleColor()`, `toDark()`, `toLight()`, `toSystem()`, `adanceToggle()` instance methods.

### Added

- **`ThemeExtension` generation**: generates `@immutable _${ClassName}Theme extends ThemeExtension`
  with `copyWith`, `lerp`, `.light(colors)` factory, `.dark(colors)` factory, and `static of(context)`.
- **`${ClassName}BestThemeMaterial` widget**: standalone `StatefulWidget` — no object instantiation needed.
  Pass it a `builder: (context, mode, lightTheme, darkTheme)` and use directly as the app root.
- **`buildLightTheme` / `buildDarkTheme` overridable hooks** on the generated `_$ClassName` base class.
  Receives the pre-built `ThemeData` (with extension already injected) so users can `copyWith` fonts,
  color schemes, app bar themes, etc. without re-declaring extensions.
- **`extensionName` annotation support**: reads `extensionName` from `@BestTheme` to name the
  `BuildContext` getter (e.g. `context.appColors`).
- **New `BuildContext` extension methods**: `toDark()`, `toLight()`, `toggleTheme()`,
  `setThemeMode(mode)`, `isDark`, `scaffoldBackgroundColor`, `primary`, `primaryScheme`.

### Changed

- Color access moved from `context.myColors.colorName` to `context.{extensionName}.colorName`
  via Flutter's `Theme.of(context).extension<_${ClassName}Theme>()`.
- Theme state is now managed by `StatefulWidget` (`_${ClassName}BestThemeMaterialState`)
  instead of a `ValueNotifier` singleton — fully compatible with Flutter's widget lifecycle.

## [1.2.0] - 2025-12-15

- Fix issue of set theme mode from ThemeData

## [1.1.0] - 2025-11-15

- you can use context.BestTheme also for routers

## [1.0.2] - 2025-10-29

- Fix issue of generating

## [1.0.1] - 2025-10-29

- Use last best_theme version

## [1.0.0] - 2025-10-29

- Updated dependencies for better compatibility and stability
- Improved support for modern Flutter and Dart projects
- Cleaned up pubspec.yaml

## [0.0.9] - 2025-9-27

## Fixed

- **Fix issue of get color on best theme in my app**

## [0.0.8] - 2025-9-27

## Fixed

- **Fix issue of class name**

## [0.0.7] - 2025-9-9

### Added

- **Singleton Pattern Implementation**: Implemented singleton pattern with `init()` and `instance` getters for better memory management
- **Context Extensions Generation**: Auto-generates BuildContext extensions for seamless theme access
- **Static Color Getters**: Generated static methods for accessing colors (`get[ColorName]`)
- **Enhanced Router Support**: Improved `BestThemeRouter` method with comprehensive MaterialApp.router support
- **Performance Optimizations**: Better initialization and memory management patterns
- **Rich Documentation**: Enhanced inline documentation and code comments in generated files

### Changed

- **BREAKING**: Complete architecture redesign from object-based to context-based approach
- **Generated Code Structure**: Completely restructured generated code for better organization
- **API Surface**: Transformed from manual instantiation to automatic singleton management
- **Initialization Process**: Changed from constructor-based to static initialization pattern
- **Color Access Pattern**: Moved from wrapper widgets to direct context access via extensions

### Improved

- **Type Safety**: Enhanced null safety and assertion handling in generated code
- **Developer Experience**: Significantly simplified usage patterns with context extensions
- **Code Generation Quality**: Better formatted and organized generated code
- **Error Handling**: Improved error messages and debugging information
- **Runtime Performance**: Optimized theme switching and color access patterns

### Enhanced

- **Code Aesthetics**: Beautiful header with generation timestamp and developer credits
- **Documentation Generation**: Comprehensive inline documentation for all generated methods
- **Method Signatures**: Improved method signatures and parameter handling
- **Extension Methods**: Rich set of BuildContext extensions for theme management
- **Class Structure**: Better organized class hierarchy and method grouping

### Technical Improvements

- **Generated Header**: Added decorative ASCII art header with metadata
- **Singleton Management**: Implemented proper singleton pattern with lazy initialization
- **Context Integration**: Deep integration with Flutter's BuildContext system
- **Static Analysis**: Better code generation for static analysis tools
- **Memory Management**: Improved memory usage patterns in generated code

### Generated Features

- `context.myColors.[colorName]` - Direct color access
- `context.isDark` - Theme state checking
- `context.toggleTheme()` - Theme toggling
- `context.BestTheme()` - App wrapper creation
- `context.BestThemeRouter()` - Router app wrapper
- Static color getters for each defined color
- Automatic singleton initialization

## [0.0.6] - 2025-1-24

### Changed

- enhancements

## [0.0.5] - 2025-1-19

### Changed

- fix issue

## [0.0.4] - 2025-1-19

### added

- Add custom colors to main class

### Changed

- Support latest analyzer

## [0.0.3] - 2024-12-29

### Changed

- support go router

## [0.0.2] - 2024-10-31

### Added

- Initial release of `best_theme_generator` package.
- Support for generating theme classes based on annotations.
- Automatic variable generation for color themes defined in `DostyColor`.
- `@BestTheme` annotation to create theme structures with light and dark modes.
- Generated code for easy access to defined colors via variable names.
- Support for theme mode toggling (light, dark, system) in the generated class.

### Fixed

- N/A (First release)

### Changed

- N/A (First release)
