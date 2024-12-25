# best_theme_annotation

`best_theme_annotation` is a Flutter annotation package designed to work with theme management systems. It provides annotation capabilities that facilitate the generation of theme color variables and help developers manage theme color states more efficiently.

This package is meant to be used alongside a generator package, such as `best_theme_generator`, to automate the process of creating color theme variables based on custom annotations.

## Features

- Provides an annotation class, `@BestTheme`, to define custom theme variables.
- Simplifies theme management by allowing you to specify color variables at design time.
- Works in conjunction with code generation tools to automatically create theme configurations based on the provided annotations.

## Installation

Add `best_theme_annotation` as a dependency in your `pubspec.yaml`:

```yaml
dependencies:
  best_theme_annotation: ^0.0.1
