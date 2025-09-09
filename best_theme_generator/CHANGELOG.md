# Changelog

All notable changes to this project will be documented in this file.

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
