import 'dart:convert';
import 'dart:io';
import 'package:string_story_utils/string_story_utils.dart';
import 'package:yaml/yaml.dart';

const String green = '\x1B[32m';
const String red = '\x1B[31m';
const String yellow = '\x1B[33m';
const String reset = '\x1B[0m';
const String checkMark = '[✓]';
const String warnMark = '[!]';

void checkPackageSetup() async {
  final List<String> issues = [];
  final List<String> ok = [];

  // Helper for colorized output
  String okMsg(String msg) => '$green$checkMark $msg$reset';
  String errMsg(String msg) => '$red$warnMark $msg$reset';

  // 1. Check pubspec.yaml dependencies
  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    log(errMsg('pubspec.yaml not found'));
    return;
  }
  final pubspec = loadYaml(pubspecFile.readAsStringSync());
  final deps = pubspec['dependencies'] as Map?;
  final devDeps = pubspec['dev_dependencies'] as Map?;
  final assets = pubspec['flutter']?['assets'] as List?;
  bool hasDep(String name) => deps != null && deps.containsKey(name);
  bool hasDevDep(String name) => devDeps != null && devDeps.containsKey(name);
  void checkDep(String name) {
    if (hasDep(name)) {
      ok.add(okMsg('Dependency "$name" found'));
    } else {
      issues.add(errMsg('Dependency "$name" missing'));
    }
  }

  void checkDevDep(String name) {
    if (hasDevDep(name)) {
      ok.add(okMsg('Dev Dependency "$name" found'));
    } else {
      issues.add(errMsg('Dev Dependency "$name" missing'));
    }
  }

  checkDep('slang');
  checkDep('slang_flutter');
  checkDep('flutter_localizations');
  checkDep('string_story');
  checkDevDep('string_story_utils');

  // 2. Check assets include folder with json translations
  bool hasJsonAsset = false;
  if (assets != null) {
    final slangYaml = await loadYaml(File("slang.yaml").readAsStringSync());
    final inputDirectory = slangYaml["input_directory"];
    for (final asset in assets) {
      if (asset is String && asset.contains(inputDirectory)) {
        hasJsonAsset = true;
        break;
      }
    }
  }
  if (hasJsonAsset) {
    ok.add(okMsg('Assets include folder with json translations'));
  } else {
    issues.add(errMsg('Assets do not include folder with json translations'));
  }

  // 3. Check translation json files are flat (no nested keys, plurals ok)
  final inputDir = Directory('lib/i18n/json');
  if (inputDir.existsSync()) {
    final jsonFiles =
        inputDir.listSync().where((f) => f.path.endsWith('.json'));
    for (final file in jsonFiles) {
      final content = File(file.path).readAsStringSync();
      try {
        final map = json.decode(content);
        if (map is Map) {
          for (final value in map.values) {
            if (value is Map &&
                !(value.keys.toSet().containsAll(
                    {'zero', 'one', 'two', 'few', 'many', 'other'}))) {
              issues.add(errMsg('Nested key found in ${file.path}'));
              break;
            }
          }
        }
      } catch (e) {
        issues.add(errMsg('Invalid JSON in ${file.path}'));
      }
    }
    ok.add(okMsg('Translation JSON files checked for flatness'));
  } else {
    issues.add(
        errMsg('Translation input directory lib/i18n/json does not exist'));
  }

  // 4. Check slang.yaml
  final slangFile = File('slang.yaml');
  if (!slangFile.existsSync()) {
    issues.add(errMsg('slang.yaml not found'));
  } else {
    final slang = loadYaml(slangFile.readAsStringSync());
    void checkSlangField(String key, bool Function(dynamic) valid,
        [String? msg]) {
      if (!slang.containsKey(key) || !valid(slang[key])) {
        issues
            .add(errMsg('slang.yaml: $key ${msg ?? 'is not set or invalid'}'));
      } else {
        ok.add(okMsg('slang.yaml: $key set'));
      }
    }

    checkSlangField(
        'base_locale', (v) => v != null && v is String && v.isNotEmpty);
    checkSlangField(
        'input_directory',
        (v) => v != null && Directory(v).existsSync(),
        'directory does not exist');
    checkSlangField(
        'output_directory',
        (v) => v != null && Directory(v).existsSync(),
        'directory does not exist');
    checkSlangField('translation_overrides', (v) => v == true);
    checkSlangField('locale_handling', (v) => v == false);
    checkSlangField('timestamp', (v) => v == false);
    checkSlangField('translation_class_visibility', (v) => v == 'public');

    // 5. Check string_story section in slang.yaml
    if (slang.containsKey('string_story')) {
      final ss = slang['string_story'] as Map?;
      if (ss == null) {
        issues.add(errMsg('slang.yaml: string_story section is not a map'));
      } else {
        if (!ss.containsKey('version_code') || ss['version_code'] is! int) {
          issues.add(errMsg(
              'slang.yaml: string_story.version_code is missing or not an integer'));
        } else {
          ok.add(okMsg('slang.yaml: string_story.version_code set'));
        }
        void checkSSDir(String key) {
          if (!ss.containsKey(key)) {
            issues.add(errMsg('slang.yaml: string_story.$key missing'));
          } else if (!Directory(ss[key]).existsSync()) {
            issues.add(errMsg(
                'slang.yaml: string_story.$key = ${ss[key]} (directory does not exist)'));
          } else {
            ok.add(okMsg('slang.yaml: string_story.$key set and exists'));
          }
        }

        checkSSDir('hash_directory');
        checkSSDir('input_directory');
        checkSSDir('output_directory');
        // translation_provider and translation_model are optional
        if ((ss.containsKey('translation_provider') &&
                ss['translation_provider'] != null) ||
            (ss.containsKey('translation_model') &&
                ss['translation_model'] != null)) {
          final envFile = ss['env_file'] ?? '.env';
          if (!File(envFile).existsSync()) {
            issues.add(errMsg(
                'slang.yaml: string_story.env_file ($envFile) does not exist'));
          } else {
            ok.add(
                okMsg('slang.yaml: string_story.env_file ($envFile) exists'));
          }
        }
      }
    } else {
      issues.add(errMsg('slang.yaml: string_story section missing'));
    }
  }

  // Output summary
  for (final msg in ok) {
    log(msg);
  }
  for (final msg in issues) {
    log(msg);
  }
  if (issues.isEmpty) {
    log('$green\nDoctor found no issues.\n$reset');
  } else {
    log('$red\nDoctor found issues in ${issues.length} categor${issues.length == 1 ? 'y' : 'ies'}.\n$reset');
  }
}
