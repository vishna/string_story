import 'package:freezed_annotation/freezed_annotation.dart';

part 'slang_base_state.freezed.dart';
part 'slang_base_state.g.dart';

@freezed
sealed class SlangBaseState with _$SlangBaseState {
  const factory SlangBaseState.idle() = SlangBaseStateIdle;

  const factory SlangBaseState.data({
    required int version,
    @Default(UserContactData()) UserContactData contactData,
    required String languageCode,
    required Map<String, dynamic> slangJson,
    required bool hasChanges,
    required bool isSubmitted,
    @Default(<String>[]) List<String> approvedKeys,
    String? lastSelectedKey,
  }) = SlangBaseStateData;

  factory SlangBaseState.fromJson(Map<String, Object?> json) =>
      _$SlangBaseStateFromJson(json);
}

@freezed
class UserContactData with _$UserContactData {
  const factory UserContactData({
    String? email,
    String? name,
    String? website,
  }) = _UserContactData;

  factory UserContactData.fromJson(Map<String, Object?> json) =>
      _$UserContactDataFromJson(json);
}
