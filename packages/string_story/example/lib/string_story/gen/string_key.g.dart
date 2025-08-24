// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';
import 'package:string_story/string_story.dart';

enum StringKey {
  aboutBtn('aboutBtn'),
  aboutText('aboutText'),
  aboutTitle('aboutTitle'),
  changeLanguage('changeLanguage'),
  developerMode('developerMode'),
  homeTitle('homeTitle'),
  localeEditor('localeEditor'),
  settingsBtn('settingsBtn'),
  settingsText('settingsText'),
  settingsTitle('settingsTitle'),
  snackbarMessage('snackbarMessage'),
  sorry('sorry'),
  stringStoryEditor('stringStoryEditor'),
  welcome('welcome');

  final String key;

  const StringKey(this.key);
}

extension StringKeyExt on StringKey {
  static StringKey? fromString(String value) {
    final key = value.split(".").first;

    final simpleKey = StringKey.values.firstWhereOrNull((it) => it.key == key);

    if (simpleKey != null) {
      return simpleKey;
    }

    final complexKey = StringKey.values.firstWhereOrNull((it) {
      return it.key.removePrefix(key).startsWith("(");
    });

    return complexKey;
  }
}
