import 'package:flutter/material.dart';

/// An abstract class that defines the interface for theme storage.
abstract class BestThemeStorage {
  /// Saves the current theme mode to storage.
  /// You can implement this method to save the theme mode to shared preferences, a database, or any other storage mechanism.
  ///
  /// example:
  /// ```dart
  /// SharedPreferences prefs = await SharedPreferences.getInstance();
  /// await prefs.setString('themeMode', mode.toString());
  /// ```
  ///
  Future<void> saveThemeMode(ThemeMode mode);

  /// Loads the saved theme mode from storage.
  /// You can implement this method to load the theme mode from shared preferences, a database, or any other storage mechanism.
  ///
  /// example:
  /// ```dart
  /// SharedPreferences prefs = await SharedPreferences.getInstance();
  /// String? themeModeString = prefs.getString('themeMode');
  /// if (themeModeString != null) {
  ///   return ThemeMode.values.firstWhere((mode) => mode.toString() == theme
  /// ModeString);
  /// }
  /// return null;
  /// ```
  Future<ThemeMode?> loadThemeMode();
}
