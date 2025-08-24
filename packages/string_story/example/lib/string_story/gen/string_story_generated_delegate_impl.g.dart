// GENERATED CODE - DO NOT MODIFY BY HAND
import 'dart:ui';

import 'package:string_story_example/string_story/gen/string_story.dart';
import 'package:string_story/string_story.dart';

class StringStoryGeneratedDelegateImpl extends StringStoryGeneratedDelegate {
  @override
  Future<void> preload(Locale locale) async {
    await SlangDelegate.delegate.load(locale);
  }

  @override
  void validateStateData(SlangBaseStateData state) {
    state.asSlangDelegate();
  }

  @override
  List<String> get permittedKeys =>
      StringKey.values.map((it) => it.key).toList();

  @override
  int get versionCode => 1;

  @override
  String get jsonAssetsPath => "lib/i18n/json";

  @override
  String get baseLocale => "en";
}
