// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slang_editor_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SlangEditorStateImpl _$$SlangEditorStateImplFromJson(
        Map<String, dynamic> json) =>
    _$SlangEditorStateImpl(
      slangJson: json['slangJson'] as Map<String, dynamic>? ?? const {},
      slangScopedJson:
          json['slangScopedJson'] as Map<String, dynamic>? ?? const {},
      baseSlangJson: json['baseSlangJson'] as Map<String, dynamic>? ?? const {},
      ovSlangJson: json['ovSlangJson'] as Map<String, dynamic>? ?? const {},
      scopedKeys: (json['scopedKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
      diffKeys: (json['diffKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedKey: json['selectedKey'] as String?,
      scrollToKey: json['scrollToKey'] as String?,
      disablePreviewFocus: json['disablePreviewFocus'] as bool? ?? true,
      searchResults: (json['searchResults'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$SlangEditorStateImplToJson(
        _$SlangEditorStateImpl instance) =>
    <String, dynamic>{
      'slangJson': instance.slangJson,
      'slangScopedJson': instance.slangScopedJson,
      'baseSlangJson': instance.baseSlangJson,
      'ovSlangJson': instance.ovSlangJson,
      'scopedKeys': instance.scopedKeys.toList(),
      'diffKeys': instance.diffKeys,
      'selectedKey': instance.selectedKey,
      'scrollToKey': instance.scrollToKey,
      'disablePreviewFocus': instance.disablePreviewFocus,
      'searchResults': instance.searchResults,
      'progress': instance.progress,
    };
