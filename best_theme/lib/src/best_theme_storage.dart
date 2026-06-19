import 'package:flutter/material.dart';

abstract class BestThemeStorage {
  Future<void> saveThemeMode(ThemeMode mode);
  Future<ThemeMode?> loadThemeMode();
}
