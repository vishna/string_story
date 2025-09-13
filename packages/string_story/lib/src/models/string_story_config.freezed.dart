// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'string_story_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StringStoryConfig {
  bool get isEnabled;
  String get appLanguageCode;
  bool get isDeveloper;

  /// Create a copy of StringStoryConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StringStoryConfigCopyWith<StringStoryConfig> get copyWith =>
      _$StringStoryConfigCopyWithImpl<StringStoryConfig>(
          this as StringStoryConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StringStoryConfig &&
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

  @override
  String toString() {
    return 'StringStoryConfig(isEnabled: $isEnabled, appLanguageCode: $appLanguageCode, isDeveloper: $isDeveloper)';
  }
}

/// @nodoc
abstract mixin class $StringStoryConfigCopyWith<$Res> {
  factory $StringStoryConfigCopyWith(
          StringStoryConfig value, $Res Function(StringStoryConfig) _then) =
      _$StringStoryConfigCopyWithImpl;
  @useResult
  $Res call({bool isEnabled, String appLanguageCode, bool isDeveloper});
}

/// @nodoc
class _$StringStoryConfigCopyWithImpl<$Res>
    implements $StringStoryConfigCopyWith<$Res> {
  _$StringStoryConfigCopyWithImpl(this._self, this._then);

  final StringStoryConfig _self;
  final $Res Function(StringStoryConfig) _then;

  /// Create a copy of StringStoryConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
    Object? appLanguageCode = null,
    Object? isDeveloper = null,
  }) {
    return _then(_self.copyWith(
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      appLanguageCode: null == appLanguageCode
          ? _self.appLanguageCode
          : appLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      isDeveloper: null == isDeveloper
          ? _self.isDeveloper
          : isDeveloper // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [StringStoryConfig].
extension StringStoryConfigPatterns on StringStoryConfig {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_StringStoryConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StringStoryConfig() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_StringStoryConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StringStoryConfig():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_StringStoryConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StringStoryConfig() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isEnabled, String appLanguageCode, bool isDeveloper)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StringStoryConfig() when $default != null:
        return $default(
            _that.isEnabled, _that.appLanguageCode, _that.isDeveloper);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isEnabled, String appLanguageCode, bool isDeveloper)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StringStoryConfig():
        return $default(
            _that.isEnabled, _that.appLanguageCode, _that.isDeveloper);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isEnabled, String appLanguageCode, bool isDeveloper)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StringStoryConfig() when $default != null:
        return $default(
            _that.isEnabled, _that.appLanguageCode, _that.isDeveloper);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StringStoryConfig implements StringStoryConfig {
  const _StringStoryConfig(
      {required this.isEnabled,
      required this.appLanguageCode,
      required this.isDeveloper});

  @override
  final bool isEnabled;
  @override
  final String appLanguageCode;
  @override
  final bool isDeveloper;

  /// Create a copy of StringStoryConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StringStoryConfigCopyWith<_StringStoryConfig> get copyWith =>
      __$StringStoryConfigCopyWithImpl<_StringStoryConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StringStoryConfig &&
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

  @override
  String toString() {
    return 'StringStoryConfig(isEnabled: $isEnabled, appLanguageCode: $appLanguageCode, isDeveloper: $isDeveloper)';
  }
}

/// @nodoc
abstract mixin class _$StringStoryConfigCopyWith<$Res>
    implements $StringStoryConfigCopyWith<$Res> {
  factory _$StringStoryConfigCopyWith(
          _StringStoryConfig value, $Res Function(_StringStoryConfig) _then) =
      __$StringStoryConfigCopyWithImpl;
  @override
  @useResult
  $Res call({bool isEnabled, String appLanguageCode, bool isDeveloper});
}

/// @nodoc
class __$StringStoryConfigCopyWithImpl<$Res>
    implements _$StringStoryConfigCopyWith<$Res> {
  __$StringStoryConfigCopyWithImpl(this._self, this._then);

  final _StringStoryConfig _self;
  final $Res Function(_StringStoryConfig) _then;

  /// Create a copy of StringStoryConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isEnabled = null,
    Object? appLanguageCode = null,
    Object? isDeveloper = null,
  }) {
    return _then(_StringStoryConfig(
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      appLanguageCode: null == appLanguageCode
          ? _self.appLanguageCode
          : appLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      isDeveloper: null == isDeveloper
          ? _self.isDeveloper
          : isDeveloper // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
