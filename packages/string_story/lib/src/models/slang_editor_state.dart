import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/json_path.dart';
import 'slang_base_state.dart';

part 'slang_editor_state.freezed.dart';
part 'slang_editor_state.g.dart';

@freezed
abstract class SlangEditorState with _$SlangEditorState {
  factory SlangEditorState({
    /// current live locale file
    @Default({}) Map<String, dynamic> slangJson,

    /// current live locale file (scoped)
    @Default({}) Map<String, dynamic> slangScopedJson,

    /// the base language unmodified locale file
    @Default({}) Map<String, dynamic> baseSlangJson,

    /// current language unmodified locale file
    @Default({}) Map<String, dynamic> ovSlangJson,
    @Default({}) Set<String> scopedKeys,
    @Default([]) List<String> diffKeys,
    String? selectedKey,
    String? scrollToKey,
    @Default(true) bool disablePreviewFocus,
    @Default([]) List<String> searchResults,
    @Default(0.0) double progress,
  }) = _SlangEditorState;

  factory SlangEditorState.fromJson(Map<String, Object?> json) =>
      _$SlangEditorStateFromJson(json);
}

extension SlangEditorStateExt on SlangEditorState {
  String baseVersion(String key) {
    try {
      return jsonPath(baseSlangJson, key);
    } catch (_) {
      return "";
    }
  }

  Object baseValue(String key) {
    return jsonPath(baseSlangJson, key);
  }

  String ovVersion(String key) {
    try {
      return jsonPath(ovSlangJson, key);
    } catch (_) {
      return "";
    }
  }

  bool hasKeyChanged(String key) {
    final left = slangJson[key];
    final right = ovSlangJson[key];
    if (left is Map || right is Map) {
      return !_dc.equals(left, right);
    }
    return left != right;
  }

  SlangEditorState computeDiff(SlangBaseStateData baseData) {
    final allKeys = baseSlangJson.keys.toList()..sort();
    final diffKeys = <String>[];
    for (final key in allKeys) {
      final ovValue = ovSlangJson[key];
      final editedValue = slangJson[key];
      if (!_dc.equals(ovValue, editedValue)) {
        diffKeys.add(key);
      }
    }

    final completed = (<String>{...diffKeys, ...baseData.approvedKeys}).length;
    final all = allKeys.length;
    final progress =
        all > 0 ? (completed.toDouble() / all.toDouble()).clamp(0.0, 1.0) : 0.0;

    return copyWith(
      diffKeys: diffKeys,
      progress: progress,
    );
  }

  int currentSearchIndex() {
    if (searchResults.isEmpty) {
      return -1;
    }
    return searchResults.indexOf(scrollToKey ?? searchResults.first);
  }

  static const _dc = DeepCollectionEquality();
}
