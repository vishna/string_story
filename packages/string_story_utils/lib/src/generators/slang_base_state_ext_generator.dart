import 'package:mustache_template/mustache.dart';
import 'package:string_story_utils/src/assets.dart';
import 'package:string_story_utils/src/utils_internal.dart';
import 'package:string_story_utils/string_story_utils.dart';

void emitSlangBaseStateExt(
    SlangConfig slangConfig, PubspecConfig pubspecConfig) {
  final template = Template(
    Assets.assets_slang_base_state_ext_mustache,
    lenient: true,
  );

  final renderedCode =
      template.renderString(makeImportsContext(slangConfig, pubspecConfig));
  BarrelFile.slangBaseStateExt.emit(config: slangConfig, content: renderedCode);
}
