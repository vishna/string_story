// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'string_story_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StringStoryConfig {
  bool get isEnabled => throw _privateConstructorUsedError;
  String get appLanguageCode => throw _privateConstructorUsedError;
  bool get isDeveloper => throw _privateConstructorUsedError;

  /// Create a copy of StringStoryConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StringStoryConfigCopyWith<StringStoryConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StringStoryConfigCopyWith<$Res> {
  factory $StringStoryConfigCopyWith(
          StringStoryConfig value, $Res Function(StringStoryConfig) then) =
      _$StringStoryConfigCopyWithImpl<$Res, StringStoryConfig>;
  @useResult
  $Res call({bool isEnabled, String appLanguageCode, bool isDeveloper});
}

/// @nodoc
class _$StringStoryConfigCopyWithImpl<$Res, $Val extends StringStoryConfig>
    implements $StringStoryConfigCopyWith<$Res> {
  _$StringStoryConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StringStoryConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? appLanguageCode = null,
    Object? isDeveloper = null,
  }) {
    return _then(_value.copyWith(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      appLanguageCode: null == appLanguageCode
          ? _value.appLanguageCode
          : appLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      isDeveloper: null == isDeveloper
          ? _value.isDeveloper
          : isDeveloper // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StringStoryConfigImplCopyWith<$Res>
    implements $StringStoryConfigCopyWith<$Res> {
  factory _$$StringStoryConfigImplCopyWith(_$StringStoryConfigImpl value,
          $Res Function(_$StringStoryConfigImpl) then) =
      __$$StringStoryConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isEnabled, String appLanguageCode, bool isDeveloper});
}

/// @nodoc
class __$$StringStoryConfigImplCopyWithImpl<$Res>
    extends _$StringStoryConfigCopyWithImpl<$Res, _$StringStoryConfigImpl>
    implements _$$StringStoryConfigImplCopyWith<$Res> {
  __$$StringStoryConfigImplCopyWithImpl(_$StringStoryConfigImpl _value,
      $Res Function(_$StringStoryConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of StringStoryConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? appLanguageCode = null,
    Object? isDeveloper = null,
  }) {
    return _then(_$StringStoryConfigImpl(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      appLanguageCode: null == appLanguageCode
          ? _value.appLanguageCode
          : appLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      isDeveloper: null == isDeveloper
          ? _value.isDeveloper
          : isDeveloper // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StringStoryConfigImpl implements _StringStoryConfig {
  const _$StringStoryConfigImpl(
      {required this.isEnabled,
      required this.appLanguageCode,
      required this.isDeveloper});

  @override
  final bool isEnabled;
  @override
  final String appLanguageCode;
  @override
  final bool isDeveloper;

  @override
  String toString() {
    return 'StringStoryConfig(isEnabled: $isEnabled, appLanguageCode: $appLanguageCode, isDeveloper: $isDeveloper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StringStoryConfigImpl &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.appLanguageCode, appLanguageCode) ||
                other.appLanguageCode == appLanguageCode) &&
            (identical(other.isDeveloper, isDeveloper) ||
                other.isDeveloper == isDeveloper));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isEnabled, appLanguageCode, isDeveloper);

  /// Create a copy of StringStoryConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StringStoryConfigImplCopyWith<_$StringStoryConfigImpl> get copyWith =>
      __$$StringStoryConfigImplCopyWithImpl<_$StringStoryConfigImpl>(
          this, _$identity);
}

abstract class _StringStoryConfig implements StringStoryConfig {
  const factory _StringStoryConfig(
      {required final bool isEnabled,
      required final String appLanguageCode,
      required final bool isDeveloper}) = _$StringStoryConfigImpl;

  @override
  bool get isEnabled;
  @override
  String get appLanguageCode;
  @override
  bool get isDeveloper;

  /// Create a copy of StringStoryConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StringStoryConfigImplCopyWith<_$StringStoryConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
