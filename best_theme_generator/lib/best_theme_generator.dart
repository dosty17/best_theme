library best_theme_generator;

import 'package:build/build.dart';
import 'package:best_theme_generator/src/json_generator.dart';

import 'package:source_gen/source_gen.dart';

Builder bestThemeGenerate(BuilderOptions options) {
  return SharedPartBuilder(
    [BestGenerator()],
    'best_theme_generator',
  );
}
