import 'package:freezed_annotation/freezed_annotation.dart';

part 'string_story_config.freezed.dart';

@freezed
class StringStoryConfig with _$StringStoryConfig {
  const factory StringStoryConfig({
    required bool isEnabled,
    required String appLanguageCode,
    required bool isDeveloper,
  }) = _StringStoryConfig;
}
