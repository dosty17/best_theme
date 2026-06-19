/// Represents an asset string path path variation configuration for theme context rules.
class BestAsset {
  /// The light variant of the asset path.
  final String light;

  /// The dark variant of the asset path.
  final String dark;

  /// Creates a [BestAsset] with specified light and dark asset paths.
  const BestAsset({
    required this.light,
    required this.dark,
  });
}
