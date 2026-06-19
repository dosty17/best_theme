import 'package:flutter/material.dart';

/// Represents a text style configuration with light and dark variations.
class BestTextStyle {
  /// The light variant of the text style.
  final TextStyle light;

  /// The dark variant of the text style.
  final TextStyle dark;

  /// Creates a [BestTextStyle] with specified light and dark text styles.
  const BestTextStyle({
    required this.light,
    required this.dark,
  });
}
