import 'package:mustache_template/mustache.dart';
import 'package:string_story_utils/src/assets.dart';
import 'package:string_story_utils/src/utils_internal.dart';
import 'package:string_story_utils/string_story_utils.dart';

void emitLocaleEditorWidget(
    SlangConfig slangConfig, PubspecConfig pubspecConfig) {
  final template = Template(
    Assets.assets_locale_editor_widget_mustache,
    lenient: true,
  );

  final renderedCode =
      template.renderString(makeImportsContext(slangConfig, pubspecConfig));
  BarrelFile.localeEditorWidget
      .emit(config: slangConfig, content: renderedCode);
}
