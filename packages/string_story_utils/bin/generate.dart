import 'package:string_story_utils/src/generators/locale_editor_sheet_generator.dart';
import 'package:string_story_utils/src/generators/locale_editor_widget_generator.dart';
import 'package:string_story_utils/src/generators/locale_submit_sheet_generator.dart';
import 'package:string_story_utils/src/generators/slang_base_state_ext_generator.dart';
import 'package:string_story_utils/src/generators/stories_generator.dart';
import 'package:string_story_utils/src/generators/string_key_generator.dart';
import 'package:string_story_utils/src/generators/string_story_core_generator.dart';
import 'package:string_story_utils/src/generators/string_story_generated_delegate_impl_generator.dart';
import 'package:string_story_utils/src/generators/string_story_screen_generator.dart';
import 'package:string_story_utils/src/generators/strings_extension_generator.dart';
import 'package:string_story_utils/src/generators/translation_scope_generator.dart';
import 'package:string_story_utils/string_story_utils.dart';

Future<void> main(List<String> args) async {
  final pubspecConfig =
      PubspecConfig.fromYaml(readYamlFileAsMap("pubspec.yaml"));
  final slangConfig = SlangConfig.fromYaml(readYamlFileAsMap("slang.yaml"));

  final storiesOnly = args.contains('--stories-only');

  if (storiesOnly) {
    emitStringKey(slangConfig);
    emitStories(slangConfig, pubspecConfig);
    return;
  }

  emitStringKey(slangConfig);
  emitStringStoryCore(slangConfig, pubspecConfig);
  emitStringsExtensions(slangConfig, pubspecConfig);
  emitStories(slangConfig, pubspecConfig);
  emitTranslationScope(slangConfig, pubspecConfig);
  emitSlangBaseStateExt(slangConfig, pubspecConfig);
  emitStringStoryGeneratedDelegateImpl(slangConfig, pubspecConfig);
  emitLocaleEditorWidget(slangConfig, pubspecConfig);
  emitLocaleEditorSheet(slangConfig, pubspecConfig);
  emitLocaleSubmitSheet(slangConfig, pubspecConfig);
  emitStringStoryScreen(slangConfig, pubspecConfig);
  emitBarrelFile(slangConfig);
}
