import 'dart:io';

import 'package:string_story_utils/src/translation_service.dart';
import 'package:string_story_utils/string_story_utils.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

/// scans base localization file and aligns all other translations files:
/// - all JSON keys are sorted alphabetically
/// - keys that are not in the base file will be removed from  translations
/// - keys that are in the base file but are not in the translations will be added
///   - if auto-translation is enabled, translation will be generated
///   - if auto-translation is not enabled, base language version will be copied
/// - a fingerprint (hash) file will be generated for every locale file
///   - whenever you change a key in the source file, other translations will be retranslated
Future<void> main() async {
  // Secrets.init(() => EnvSecrets(filenames: [".server.env"]));
  final slangConfig = SlangConfig.fromYaml(readYamlFileAsMap("slang.yaml"));
  final slangJson =
      tryLoadSlangJson(slangConfig: slangConfig, code: slangConfig.baseLocale);

  if (slangJson == null) {
    throw StateError(
        "Could't load base slang json file (${slangConfig.baseLocale.toUpperCase()})");
  }

  final keys = slangJson.keys.where((key) => !key.startsWith("@")).toList()
    ..sort();
  final fromItems = keys
      .map((key) => JsonItem(
            key: key,
            value: JsonItemValue.from(slangJson[key]),
          ))
      .toList()
      .cast<JsonItem>();

  final from = slangConfig.baseLocale;

  final languagesToTranslate =
      availableCodes(slangConfig).where((it) => it != from);

  for (final to in languagesToTranslate) {
    await _localize(
        from: from, to: to, fromItems: fromItems, slangConfig: slangConfig);
  }

  _saveAlphabeticallyBase(slangConfig);
}

Future<void> _saveAlphabeticallyBase(SlangConfig slangConfig) async {
  final slangJson =
      tryLoadSlangJson(slangConfig: slangConfig, code: slangConfig.baseLocale);

  final slangJsonSorted = slangJson!.sortedAlphabetically();

  File(
      slangJsonFilePath(code: slangConfig.baseLocale, slangConfig: slangConfig))
    ..ensureParentDirectoryExistsSync()
    ..writeAsStringSync(jsonPrettyEncoder.convert(slangJsonSorted));
}

/// this checks for preexisting keys:
/// - if the original changed, the value translation will be requested
/// - if pre-existing key is not found in the original, it will be removed
/// - if the original and translation have matching key and fastHash stored
/// under description, the translation request is skipped
Future<void> _localize({
  required SlangConfig slangConfig,
  required String from,
  required String to,
  required List<JsonItem> fromItems,
}) async {
  final slangJson = tryLoadSlangJson(slangConfig: slangConfig, code: to) ??
      <String, dynamic>{};
  final hashJson = tryLoadHashJson(
        slangConfig: slangConfig,
        code: to,
      ) ??
      <String, dynamic>{};

  final existingToKeys = slangJson.keys.toList()..sort();
  final existingToItems = existingToKeys
      .map((key) {
        return JsonItem(
          key: key,
          value:
              JsonItemValue.from(slangJson[key], hashOverride: hashJson[key]),
        );
      })
      .toList()
      .cast<JsonItem>();

  final keysToUpdate = <String>[];
  final keysToKeep = <String>[];
  for (final fromItem in fromItems) {
    final existingToItem = existingToItems.findByKeyOrNull(fromItem.key);
    if (existingToItem != null &&
        existingToItem.value.fastHash == fromItem.value.fastHash) {
      keysToKeep.add(fromItem.key);
    } else {
      keysToUpdate.add(fromItem.key);
    }
  }

  final itemsToUpdateSplitted = splitArray(
      keysToUpdate.map((key) => fromItems.findByKey(key)).toList(), 49);

  final updatedItems = <JsonItem>[];
  for (final itemsToUpdate in itemsToUpdateSplitted) {
    if (itemsToUpdate.isEmpty) {
      continue;
    }
    var text = <String>[];
    for (final item in itemsToUpdate) {
      final jsonItemValue = item.value;
      text.addAll(switch (jsonItemValue) {
        JsonItemStringValue() => [jsonItemValue.value],
        JsonItemMapValue() => jsonItemValue.valuesSorted,
      });
    }

    final dotFile = slangConfig.stringStory.envFile;
    if (await File(dotFile).exists()) {
      agentDotEnv(dotFile);
    }

    final translation = await TranslationService.translate(
      inputPhrases: text,
      stringStoryConfig: slangConfig.stringStory,
      to: to,
      from: from,
    );

    var currentIndex = 0;
    for (final item in itemsToUpdate) {
      final itemValue = item.value;
      switch (itemValue) {
        case JsonItemStringValue():
          updatedItems.add(
            JsonItem(
              key: item.key,
              value: JsonItemStringValue(
                value: translation[currentIndex],
                fastHash: itemValue.fastHash,
              ),
            ),
          );
          currentIndex++;
          break;
        case JsonItemMapValue():
          updatedItems.add(
            JsonItem(
              key: item.key,
              value: JsonItemMapValue(
                value: {
                  for (int i = 0; i < itemValue.value.length; i++)
                    itemValue.keysSorted[i]: translation[currentIndex + i]
                },
                fastHash: itemValue.fastHash,
              ),
            ),
          );
          currentIndex += itemValue.value.length;
          break;
      }
    }
  }

  final allItems = fromItems
      .map((it) =>
          updatedItems.findByKeyOrNull(it.key) ??
          existingToItems.findByKey(it.key))
      .toList();

  final outputJson = <String, dynamic>{
    for (final item in allItems) ...{
      item.key: switch (item.value) {
        JsonItemStringValue(:final value) => value,
        JsonItemMapValue(:final value) => value,
      },
    }
  };

  log("[${to.toUpperCase()}]: updated keys (${updatedItems.length})");

  File(slangJsonFilePath(code: to, slangConfig: slangConfig))
    ..ensureParentDirectoryExistsSync()
    ..writeAsStringSync(jsonPrettyEncoder.convert(outputJson));

  hashJson.removeWhere(
      (key, value) => allItems.indexWhere((it) => it.key == key) == -1);
  for (final updatedItem in updatedItems) {
    hashJson[updatedItem.key] = updatedItem.value.fastHash;
  }

  File(hashJsonFilePath(slangConfig: slangConfig, code: to))
    ..ensureParentDirectoryExistsSync()
    ..writeAsStringSync(
        jsonPrettyEncoder.convert(hashJson.sortedAlphabetically()));
}

extension on Map<String, dynamic> {
  Map<String, dynamic> sortedAlphabetically() {
    final keys = this.keys.toList()..sort();
    final output = <String, dynamic>{for (final key in keys) key: this[key]};
    return output;
  }
}

extension _ListArbItem on List<JsonItem> {
  JsonItem findByKey(String key) => firstWhere((it) => it.key == key);
  JsonItem? findByKeyOrNull(String key) =>
      firstWhereOrNull((it) => it.key == key);
}

List<List<JsonItem>> splitArray(List<JsonItem> inputArray, int maxLength) {
  List<List<JsonItem>> result = [];
  result.add(<JsonItem>[]);
  final counter = [0];
  for (int i = 0; i < inputArray.length; i++) {
    final item = inputArray[i];
    var topArray = result.last;
    final countValue = switch (item.value) {
      JsonItemStringValue() => 1,
      JsonItemMapValue(:final value) => value.keys.length,
    };
    var nextCountValue = counter.last + countValue;

    if (nextCountValue >= maxLength) {
      topArray = <JsonItem>[];
      result.add(topArray);
      counter.add(0);
      nextCountValue = countValue;
    }

    topArray.add(item);
    counter[result.length - 1] = nextCountValue;
  }
  return result;
}
