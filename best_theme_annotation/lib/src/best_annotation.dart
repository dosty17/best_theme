class BestTheme {
  /// The name of the getter extension on [BuildContext].
  /// Defaults to 'bestTheme' if not provided (e.g., context.bestTheme).
  final String extensionName;

  const BestTheme({this.extensionName = 'bestTheme'});
}

/// Global shorthand annotation instance with default parameters.
const bestTheme = BestTheme();
