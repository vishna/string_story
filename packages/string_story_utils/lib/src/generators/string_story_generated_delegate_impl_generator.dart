import 'package:mustache_template/mustache.dart';
import 'package:string_story_utils/src/assets.dart';
import 'package:string_story_utils/src/utils_internal.dart';
import 'package:string_story_utils/string_story_utils.dart';

void emitStringStoryGeneratedDelegateImpl(
    SlangConfig slangConfig, PubspecConfig pubspecConfig) {
  final template = Template(
    Assets.assets_string_story_generated_delegate_impl_mustache,
    lenient: true,
  );

  final renderedCode = template.renderString({
    ...makeImportsContext(slangConfig, pubspecConfig),
    'versionCode': slangConfig.stringStory.versionCode,
    'jsonAssetsPath': slangConfig.inputDirectory,
    'baseLocale': slangConfig.baseLocale,
  });
  BarrelFile.stringStoryGeneratedDelegateImpl
      .emit(config: slangConfig, content: renderedCode);
}
