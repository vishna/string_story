import 'dart:io';

import 'package:string_story_utils/string_story_utils.dart';

enum BarrelFile {
  /// the barrel file
  stringStory("string_story"),

  /// contains the core `StringStory` class that can be used by apps
  stringStoryCore("string_story_core"),

  /// BuildContext.strings extension + SlangDelegate
  stringsExtension("strings_extension"),

  /// Builds an array that points to all the user defined stories
  stories("stories"),

  /// Classes responsible for capturing keys on the screen
  translationScope("translation_scope"),

  /// SlangBaseState extension methods that need to be generated
  slangBaseStateExt("slang_base_state_ext"),

  /// util class you can pass to [StringStoryService.setBuilder]
  stringStoryGeneratedDelegateImpl("string_story_generated_delegate_impl"),

  /// [LocaleEditorWidget]
  localeEditorWidget("locale_editor_widget"),

  /// [LocaleEditorSheet]
  localeEditorSheet("locale_editor_sheet"),

  /// [LocaleSubmitSheet]
  localeSubmitSheet("locale_submit_sheet"),

  /// [StringStoryScreen]
  stringStoryScreen("string_story_screen"),

  /// enum with string keys based off localization file
  stringKey("string_key");

  final String name;

  const BarrelFile(this.name);

  String get fileName {
    if (this == BarrelFile.stringStory) {
      return "$name.dart";
    } else {
      return "$name.g.dart";
    }
  }

  void emit({
    required SlangConfig config,
    required String content,
  }) {
    log("emitting $fileName");

    File('${config.stringStory.outputDirectory}/$fileName')
      ..ensureParentDirectoryExistsSync()
      ..writeAsStringSync("// GENERATED CODE - DO NOT MODIFY BY HAND\n$content",
          mode: FileMode.write)
      ..formatFile();
  }
}

void emitBarrelFile(SlangConfig slangConfig) {
  final allFiles = BarrelFile.values.toList()..remove(BarrelFile.stringStory);
  final content =
      allFiles.map((it) => """export '${it.fileName}';""").join("\n");

  BarrelFile.stringStory.emit(config: slangConfig, content: content);
}
