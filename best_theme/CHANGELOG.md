# Changelog

All notable changes to this project will be documented in this file.
## [1.0.1]
### Changed
- Improve documentation

## [1.0.0]
### Added
- Updated main package with improved dependency management
- Enhanced compatibility with Dart 3.x and Flutter 3.x
- Optimized internal structure for better code generation

### Improved
- Cleaned up pubspec.yaml
- Simplified developer experience and setup
- Improved stability and performance for theme management


## [0.0.4] - 2025-9-9
### Added
-  **Context-based Access**: Complete redesign with BuildContext extensions for seamless theme management
-  **Enhanced Code Generation**: Beautiful header with emojis and improved documentation in generated code
- **Direct Color Access**: Access colors directly via `context.myColors.[colorName]` without wrapper widgets
- **Simplified Theme Control**: Theme management through context extensions (`context.toggleTheme()`, `context.toDarkTheme()`, etc.)
- **Singleton Pattern**: Implemented singleton pattern with `init()` method for better memory management
- **Static Color Getters**: Added static getter methods for each color variable
- **Type Safety**: Improved type safety with better null handling and assertions
- **Performance Optimization**: Eliminated need for `BestThemeBuilder` wrapper, reducing widget tree complexity

### Changed
- **BREAKING**: Replaced object-based approach with context extensions
-  **BREAKING**: `BestThemeBuilder` is now deprecated in favor of direct context access
-  **API Redesign**: Simplified API from `myTheme.toggle()` to `context.toggleTheme()`
-  **Generated Code Structure**: Improved generated code organization and readability
-  **Initialization Process**: Changed from manual object creation to automatic singleton initialization
-  **Documentation**: Enhanced inline documentation and code comments

### Improved
-  **Developer Experience**: Significantly simplified usage patterns
-  **Code Generation**: Added beautiful header with generation timestamp and developer credits
-  **Error Handling**: Better error messages and assertions for debugging
-  **Memory Management**: More efficient memory usage with singleton pattern
-  **Performance**: Reduced widget rebuilds and improved theme switching speed

### Deprecated
- ⚠️ `BestThemeBuilder` widget (use direct context access instead)
- ⚠️ Manual theme object creation (automatic initialization via context now)

### Migration Guide
- **Old**: Create theme object → Use `BestThemeBuilder` → Access via `theme.colorName`
- **New**: Use `context.BestTheme()` → Access directly via `context.myColors.colorName`
- **Theme Control**: `myTheme.toggle()` → `context.toggleTheme()`
- **State Check**: `myTheme.isDark` → `context.isDark`

## [0.0.3] - 2025-1-19
### added
- Added custom colors to main class
- Support latest analyzer

## [0.0.2] - 2024-12-29
### Added
- Support go router

## [0.0.1] - 2024-12-26
### Added
- Initial release of `best_theme` package.
- Support for easy theme management with custom colors.
- Dark and light mode toggling functionality.
- System, Light, and Dark theme modes.
- `BestColor` support for defining color variables.
- Annotation-based color generation with `@BestTheme`.
- Context-based short methods for `primary`, `scaffoldBackgroundColor`, `cardColor`, and more.
- `toggle()` method for theme switching and additional methods like `toLight()`, `toDark()`, and `toSystem()`.

### Fixed
- N/A (First release)

### Changed
- N/A (First release)
