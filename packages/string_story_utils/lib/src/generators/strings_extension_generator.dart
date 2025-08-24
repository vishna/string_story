import 'package:mustache_template/mustache.dart';
import 'package:string_story_utils/src/assets.dart';
import 'package:string_story_utils/src/utils_internal.dart';
import 'package:string_story_utils/string_story_utils.dart';

void emitStringsExtensions(
    SlangConfig slangConfig, PubspecConfig pubspecConfig) {
  final template = Template(
    Assets.assets_strings_extension_mustache,
    lenient: true,
  );

  final renderedCode =
      template.renderString(makeImportsContext(slangConfig, pubspecConfig));
  BarrelFile.stringsExtension.emit(config: slangConfig, content: renderedCode);
}
