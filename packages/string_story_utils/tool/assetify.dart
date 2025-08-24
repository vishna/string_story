import 'dart:convert';
import 'dart:io';
import 'package:string_story_utils/string_story_utils.dart';
import 'package:yaml/yaml.dart';

void main() {
  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    stderr.writeln('pubspec.yaml not found in current directory.');
    exit(1);
  }

  final pubspecContent = pubspecFile.readAsStringSync();
  final pubspec = loadYaml(pubspecContent);

  if (pubspec['assets'] == null) {
    stderr.writeln('No assets found in pubspec.yaml.');
    exit(0);
  }

  final assets = List<String>.from(pubspec['assets']);
  final buffer = StringBuffer()
    ..writeln('// GENERATED CODE - DO NOT MODIFY BY HAND')
    ..writeln(
        '// ignore_for_file: constant_identifier_names, non_constant_identifier_names')
    ..writeln("import 'dart:convert';")
    ..writeln('')
    ..writeln('class Assets {');

  for (final assetPath in assets) {
    final file = File(assetPath);
    if (!file.existsSync()) {
      stderr.writeln('Warning: asset file not found: $assetPath');
      continue;
    }

    final bytes = file.readAsBytesSync();
    final base64 = base64Encode(bytes);
    final fieldName = _toIdentifier(assetPath);

    buffer.writeln('  static const String _$fieldName = \'$base64\';');
    buffer.writeln('  static String get $fieldName => _decode(_$fieldName);');
  }

  buffer.writeln('}');

  buffer.write(
      """String _decode(String base64String) => utf8.decode(base64Decode(base64String));""");

  final outputFile = File('lib/src/assets.dart');
  outputFile
    ..writeAsStringSync(buffer.toString())
    ..formatFile();

  stdout
      .writeln('✅ Generated lib/src/assets.dart with ${assets.length} assets.');
}

String _toIdentifier(String path) {
  // Convert "assets/config.json" → "assets_config_json"
  return path
      .replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '_')
      .replaceAll(RegExp(r'_+'), '_');
}
