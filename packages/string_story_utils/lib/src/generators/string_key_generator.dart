import 'package:mustache_template/mustache.dart';
import 'package:string_story_utils/src/assets.dart';
import 'package:string_story_utils/string_story_utils.dart';

void emitStringKey(SlangConfig slangConfig) {
  final slangJson = tryLoadSlangJson(
          code: slangConfig.baseLocale, slangConfig: slangConfig) ??
      <String, dynamic>{};
  final existingToKeys = slangJson.keys.toList()..sort();

  final template = Template(
    Assets.assets_string_key_mustache,
    lenient: true,
  );

  final context = <String, dynamic>{
    'items': [
      for (int i = 0; i < existingToKeys.length; i++)
        <String, String>{
          'name': _normalizeKeyName(existingToKeys[i]),
          'value': existingToKeys[i],
          'terminator': (i == existingToKeys.length - 1) ? ";" : ",",
        },
    ]
  };

  final renderedCode = template.renderString(context);
  BarrelFile.stringKey.emit(config: slangConfig, content: renderedCode);
}

String _normalizeKeyName(String key) {
  if (key.contains("(")) {
    return key.substring(0, key.indexOf("("));
  } else {
    return key;
  }
}
