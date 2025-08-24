import 'dart:convert';
import 'dart:io';

import 'package:string_story_utils/src/models/slang_base_state.dart';
import 'package:string_story_utils/string_story_utils.dart';

/// Example CLI usage `dart run string_story_utils:apply_diff my_diff.json`
Future<void> main(List<String> args) async {
  final slangConfig = SlangConfig.fromYaml(readYamlFileAsMap("slang.yaml"));
  final inputFiles =
      args.map((it) => it.trim()).where((it) => it.isNotEmpty).toList();

  final slangJson =
      tryLoadSlangJson(code: slangConfig.baseLocale, slangConfig: slangConfig);

  if (slangJson == null) {
    log("Failed to load base locale file");
    exit(1);
  }

  final baseKeys = slangJson.keys.toList()..sort();

  if (inputFiles.isEmpty) {
    log("No files passed to apply");
    exit(1);
  }

  final files = args.map((it) => File(it)).toList();
  final diffs = <SlangBaseStateData>[];

  for (final file in files) {
    if (!file.existsSync()) {
      log("File ${file.path} doesn't exist");
      exit(1);
    }

    try {
      final diff =
          SlangBaseStateData.fromJson(jsonDecode(file.readAsStringSync()));
      if (diff.version != slangConfig.stringStory.versionCode) {
        log("Wrong versionCode of ${file.path}. Expected ${slangConfig.stringStory.versionCode} got ${diff.version}");
        exit(1);
      }
      diffs.add(diff);
    } catch (e, s) {
      log("Filed to load ${file.path}, $e $s");
      exit(1);
    }
  }

  for (final diff in diffs) {
    _applyDiff(config: slangConfig, diff: diff, baseKeys: baseKeys);
  }
}

void _applyDiff({
  required SlangConfig config,
  required SlangBaseStateData diff,
  required List<String> baseKeys,
}) {
  var count = 0;
  final slangJson =
      tryLoadSlangJson(code: diff.languageCode, slangConfig: config);

  if (slangJson == null) {
    log("Failed to load locale json (${diff.languageCode.toUpperCase()})");
    exit(1);
  }

  for (final stringKey in baseKeys) {
    final update = diff.slangJson[stringKey];
    if (update == null) {
      continue;
    }

    if (slangJson[stringKey] == update) {
      continue;
    }

    slangJson[stringKey] = update;
    count++;
  }

  if (count > 0) {
    log("Updated $count keys for (${diff.languageCode.toUpperCase()})");
    File(slangJsonFilePath(code: diff.languageCode, slangConfig: config))
        .writeAsStringSync(jsonPrettyEncoder.convert(slangJson));
  } else {
    log("All keys up to date (${diff.languageCode.toUpperCase()})");
  }
}
