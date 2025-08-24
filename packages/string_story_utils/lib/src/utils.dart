import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:dartantic_ai/dartantic_ai.dart';
import 'package:dotenv/dotenv.dart';
import 'package:mustache_template/mustache.dart';
// ignore: depend_on_referenced_packages
import "package:recase/recase.dart";
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart' as crypto;
import 'package:string_story_utils/string_story_utils.dart';
import 'package:yaml/yaml.dart';
import 'package:sealed_languages/sealed_languages.dart';

const jsonPrettyEncoder = JsonEncoder.withIndent('  ');

String slangJsonFilePath(
        {required String code, required SlangConfig slangConfig}) =>
    '${slangConfig.inputDirectory}/$code.i18n.json';

String hashJsonFilePath(
        {required String code, required SlangConfig slangConfig}) =>
    '${slangConfig.stringStory.hashDirectory}/$code.hash.json';

List<String> availableCodes(SlangConfig slangConfig) {
  final dir = Directory(slangConfig.inputDirectory);

  if (!dir.existsSync()) {
    return [];
  }

  return dir
      .listSync()
      .whereType<File>()
      .map((file) => file.uri.pathSegments.last) // filename only
      .where((name) => name.endsWith('.i18n.json'))
      .map((name) => name.replaceAll('.i18n.json', ''))
      .toList();
}

Map<String, dynamic>? tryLoadSlangJson(
    {required String code, required SlangConfig slangConfig}) {
  try {
    final jsonFilePath =
        slangJsonFilePath(code: code, slangConfig: slangConfig);

    final jsonFileStr = File(jsonFilePath).readAsStringSync();
    return jsonDecode(jsonFileStr) as Map<String, dynamic>;
  } catch (_) {
    return null;
  }
}

Map<String, dynamic>? tryLoadHashJson(
    {required String code, required SlangConfig slangConfig}) {
  try {
    final jsonFilePath = hashJsonFilePath(code: code, slangConfig: slangConfig);

    final jsonFileStr = File(jsonFilePath).readAsStringSync();
    return jsonDecode(jsonFileStr) as Map<String, dynamic>;
  } catch (_) {
    return null;
  }
}

extension FastHash on String {
  String md5() => crypto.md5.convert(utf8.encode(this)).toString();
  String fastHash() => md5();
}

sealed class JsonItemValue {
  const JsonItemValue({required this.fastHash});
  final String fastHash;

  static JsonItemValue from(Object value, {String? hashOverride}) {
    if (value is String) {
      return JsonItemStringValue(
          fastHash: hashOverride ?? value.fastHash(), value: value);
    }
    final mapValue = value as Map<String, dynamic>;
    final keys = mapValue.keys.toList()..sort();
    final hashableString = keys.map((key) => mapValue[key]).join(",");
    return JsonItemMapValue(
        value: mapValue, fastHash: hashOverride ?? hashableString.fastHash());
  }
}

class JsonItemStringValue extends JsonItemValue {
  final String value;

  const JsonItemStringValue({
    required this.value,
    required super.fastHash,
  });
}

class JsonItemMapValue extends JsonItemValue {
  final Map<String, dynamic> value;

  List<String> get keysSorted => value.keys.toList()..sort();
  List<String> get valuesSorted =>
      keysSorted.map((key) => value[key] as String).toList();

  const JsonItemMapValue({
    required this.value,
    required super.fastHash,
  });
}

class JsonItem {
  final String key;
  final JsonItemValue value;

  const JsonItem({
    required this.key,
    required this.value,
  });
}

Map<String, dynamic> sanitizeYamlMap(dynamic unsanitized) =>
    jsonDecode(jsonEncode(unsanitized));

/// consider adding this https://github.com/felangel/mason/pull/332
extension MustacheRecaseExt on Map<String, dynamic> {
  Map<String, dynamic> get withLambdas {
    return {
      ...this,
      ...cases,
    };
  }
}

// copy of mustache_recase_base

// snake_case
// dot.case
// path/case
// param-case
// PascalCase
// Header-Case
// Title Case
// camelCase
// Sentence case
// CONSTANT_CASE

/// The bunch of case conversions functions
//@generationAssignment("new-case")
Map<String, Function> cases = {
  "camel_case": (LambdaContext ctx) => ReCase(ctx.renderString()).camelCase,
  "snake_case": (LambdaContext ctx) => ReCase(ctx.renderString()).snakeCase,
  "pascal_case": (LambdaContext ctx) => ReCase(ctx.renderString()).pascalCase,
  "param_case": (LambdaContext ctx) => ReCase(ctx.renderString()).paramCase,
  "title_case": (LambdaContext ctx) => ReCase(ctx.renderString()).titleCase,
  "sentence_case": (LambdaContext ctx) =>
      ReCase(ctx.renderString()).sentenceCase,
  "header_case": (LambdaContext ctx) => ReCase(ctx.renderString()).headerCase,
  "constant_case": (LambdaContext ctx) =>
      ReCase(ctx.renderString()).constantCase,
  "path_case": (LambdaContext ctx) => ReCase(ctx.renderString()).pathCase,
  "dot_case": (LambdaContext ctx) => ReCase(ctx.renderString()).dotCase,
  "camelCase": (LambdaContext ctx) => ReCase(ctx.renderString()).camelCase,
  "snakeCase": (LambdaContext ctx) => ReCase(ctx.renderString()).snakeCase,
  "pascalCase": (LambdaContext ctx) => ReCase(ctx.renderString()).pascalCase,
  "paramCase": (LambdaContext ctx) => ReCase(ctx.renderString()).paramCase,
  "titleCase": (LambdaContext ctx) => ReCase(ctx.renderString()).titleCase,
  "sentenceCase": (LambdaContext ctx) =>
      ReCase(ctx.renderString()).sentenceCase,
  "headerCase": (LambdaContext ctx) => ReCase(ctx.renderString()).headerCase,
  "constantCase": (LambdaContext ctx) =>
      ReCase(ctx.renderString()).constantCase,
  "pathCase": (LambdaContext ctx) => ReCase(ctx.renderString()).pathCase,
  "dotCase": (LambdaContext ctx) => ReCase(ctx.renderString()).dotCase,
};

extension StringStoryFileExtensions on File {
  /// Ensures the parent directory of [file] exists.
  /// Creates it (recursively) if it doesn't.
  void ensureParentDirectoryExistsSync() {
    final directory = parent;
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
  }

  /// Applies formating to the dart file
  void formatFile() {
    if (!path.endsWith(".dart")) {
      return;
    }

    try {
      final data = Process.runSync(
        '/bin/sh',
        ['-c', 'dart format $path'],
      );

      if (data.exitCode == 0) {
        final res = data.stdout.toString();
        log(res);
      } else {
        log("Error while running command   :   ${data.stderr.toString()}");
      }
    } catch (e, s) {
      log("Catch error $e");
      log(s);
    }
  }
}

YamlMap readYamlFileAsMap(String filePath) {
  final file = File(filePath);

  if (!file.existsSync()) {
    log('Error: File not found at $filePath');
    exit(1);
  }

  final yamlString = file.readAsStringSync();
  return loadYaml(yamlString) as YamlMap;
}

const _supportedAgentKeys = [
  "OPENAI_API_KEY",
  "ANTHROPIC_API_KEY",
  "GEMINI_API_KEY",
  "MISTRAL_API_KEY",
  "COHERE_API_KEY",
  "OPENROUTER_API_KEY",
  "TOGETHER_API_KEY",
  "LAMBDA_API_KEY"
];

void agentDotEnv(String fileName) {
  final env = DotEnv()..load([fileName]);

  for (final supportedKey in _supportedAgentKeys) {
    if (env.isDefined(supportedKey)) {
      Agent.environment[supportedKey] = env[supportedKey]!;
    }
  }
}

bool hasAnyAgentKey() {
  bool isDefined(String? value) => value != null && value.trim().isNotEmpty;
  for (final supportedKey in _supportedAgentKeys) {
    if (isDefined(Agent.environment[supportedKey]) ||
        isDefined(Platform.environment[supportedKey])) {
      return true;
    }
  }
  return false;
}

String getLanguageName(String code) {
  final parts = code.split(RegExp(r'[-_ ]'));
  final languageCode = parts[0].toLowerCase();
  final countryCode = parts.length > 1 ? parts[1].toUpperCase() : null;

  // Use maybeFromCodeShort so it returns null if not found
  final language = NaturalLanguage.maybeFromCodeShort(languageCode);

  final languageName = language?.name ?? languageCode;

  if (countryCode != null) {
    return '$languageName ($countryCode)';
  }
  return languageName;
}
