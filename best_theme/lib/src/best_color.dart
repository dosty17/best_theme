import 'package:flutter/material.dart';

/// Represents a theme color with light and dark variations.
class BestColor {
  /// The name of the color.
  final String name;

  /// The light variant of the color.
  final Color light;

  /// The dark variant of the color.
  final Color dark;

  /// Creates a [BestColor] with specified light and dark colors.
  const BestColor({
    required this.name,
    required this.light,
    required this.dark,
  });

  /// Converts the color into a map format with `light` and `dark` keys.
  Map<String, Color> toMap() {
    return <String, Color>{'light': light, 'dark': dark};
  }
}
