// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slang_base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SlangBaseState _$SlangBaseStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'idle':
      return SlangBaseStateIdle.fromJson(json);
    case 'data':
      return SlangBaseStateData.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SlangBaseState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SlangBaseState {
  /// Serializes this SlangBaseState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SlangBaseState);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SlangBaseState()';
  }
}

/// @nodoc
class $SlangBaseStateCopyWith<$Res> {
  $SlangBaseStateCopyWith(SlangBaseState _, $Res Function(SlangBaseState) __);
}

/// Adds pattern-matching-related methods to [SlangBaseState].
extension SlangBaseStatePatterns on SlangBaseState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SlangBaseStateIdle value)? idle,
    TResult Function(SlangBaseStateData value)? data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SlangBaseStateIdle() when idle != null:
        return idle(_that);
      case SlangBaseStateData() when data != null:
        return data(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(SlangBaseStateIdle value) idle,
    required TResult Function(SlangBaseStateData value) data,
  }) {
    final _that = this;
    switch (_that) {
      case SlangBaseStateIdle():
        return idle(_that);
      case SlangBaseStateData():
        return data(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SlangBaseStateIdle value)? idle,
    TResult? Function(SlangBaseStateData value)? data,
  }) {
    final _that = this;
    switch (_that) {
      case SlangBaseStateIdle() when idle != null:
        return idle(_that);
      case SlangBaseStateData() when data != null:
        return data(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            int version,
            UserContactData contactData,
            String languageCode,
            Map<String, dynamic> slangJson,
            bool hasChanges,
            bool isSubmitted,
            List<String> approvedKeys,
            String? lastSelectedKey)?
        data,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SlangBaseStateIdle() when idle != null:
        return idle();
      case SlangBaseStateData() when data != null:
        return data(
            _that.version,
            _that.contactData,
            _that.languageCode,
            _that.slangJson,
            _that.hasChanges,
            _that.isSubmitted,
            _that.approvedKeys,
            _that.lastSelectedKey);
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
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            int version,
            UserContactData contactData,
            String languageCode,
            Map<String, dynamic> slangJson,
            bool hasChanges,
            bool isSubmitted,
            List<String> approvedKeys,
            String? lastSelectedKey)
        data,
  }) {
    final _that = this;
    switch (_that) {
      case SlangBaseStateIdle():
        return idle();
      case SlangBaseStateData():
        return data(
            _that.version,
            _that.contactData,
            _that.languageCode,
            _that.slangJson,
            _that.hasChanges,
            _that.isSubmitted,
            _that.approvedKeys,
            _that.lastSelectedKey);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
            int version,
            UserContactData contactData,
            String languageCode,
            Map<String, dynamic> slangJson,
            bool hasChanges,
            bool isSubmitted,
            List<String> approvedKeys,
            String? lastSelectedKey)?
        data,
  }) {
    final _that = this;
    switch (_that) {
      case SlangBaseStateIdle() when idle != null:
        return idle();
      case SlangBaseStateData() when data != null:
        return data(
            _that.version,
            _that.contactData,
            _that.languageCode,
            _that.slangJson,
            _that.hasChanges,
            _that.isSubmitted,
            _that.approvedKeys,
            _that.lastSelectedKey);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class SlangBaseStateIdle implements SlangBaseState {
  const SlangBaseStateIdle({final String? $type}) : $type = $type ?? 'idle';
  factory SlangBaseStateIdle.fromJson(Map<String, dynamic> json) =>
      _$SlangBaseStateIdleFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$SlangBaseStateIdleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SlangBaseStateIdle);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SlangBaseState.idle()';
  }
}

/// @nodoc
@JsonSerializable()
class SlangBaseStateData implements SlangBaseState {
  const SlangBaseStateData(
      {required this.version,
      this.contactData = const UserContactData(),
      required this.languageCode,
      required final Map<String, dynamic> slangJson,
      required this.hasChanges,
      required this.isSubmitted,
      final List<String> approvedKeys = const <String>[],
      this.lastSelectedKey,
      final String? $type})
      : _slangJson = slangJson,
        _approvedKeys = approvedKeys,
        $type = $type ?? 'data';
  factory SlangBaseStateData.fromJson(Map<String, dynamic> json) =>
      _$SlangBaseStateDataFromJson(json);

  final int version;
  @JsonKey()
  final UserContactData contactData;
  final String languageCode;
  final Map<String, dynamic> _slangJson;
  Map<String, dynamic> get slangJson {
    if (_slangJson is EqualUnmodifiableMapView) return _slangJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_slangJson);
  }

  final bool hasChanges;
  final bool isSubmitted;
  final List<String> _approvedKeys;
  @JsonKey()
  List<String> get approvedKeys {
    if (_approvedKeys is EqualUnmodifiableListView) return _approvedKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approvedKeys);
  }

  final String? lastSelectedKey;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SlangBaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SlangBaseStateDataCopyWith<SlangBaseStateData> get copyWith =>
      _$SlangBaseStateDataCopyWithImpl<SlangBaseStateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SlangBaseStateDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SlangBaseStateData &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.contactData, contactData) ||
                other.contactData == contactData) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            const DeepCollectionEquality()
                .equals(other._slangJson, _slangJson) &&
            (identical(other.hasChanges, hasChanges) ||
                other.hasChanges == hasChanges) &&
            (identical(other.isSubmitted, isSubmitted) ||
                other.isSubmitted == isSubmitted) &&
            const DeepCollectionEquality()
                .equals(other._approvedKeys, _approvedKeys) &&
            (identical(other.lastSelectedKey, lastSelectedKey) ||
                other.lastSelectedKey == lastSelectedKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      version,
      contactData,
      languageCode,
      const DeepCollectionEquality().hash(_slangJson),
      hasChanges,
      isSubmitted,
      const DeepCollectionEquality().hash(_approvedKeys),
      lastSelectedKey);

  @override
  String toString() {
    return 'SlangBaseState.data(version: $version, contactData: $contactData, languageCode: $languageCode, slangJson: $slangJson, hasChanges: $hasChanges, isSubmitted: $isSubmitted, approvedKeys: $approvedKeys, lastSelectedKey: $lastSelectedKey)';
  }
}

/// @nodoc
abstract mixin class $SlangBaseStateDataCopyWith<$Res>
    implements $SlangBaseStateCopyWith<$Res> {
  factory $SlangBaseStateDataCopyWith(
          SlangBaseStateData value, $Res Function(SlangBaseStateData) _then) =
      _$SlangBaseStateDataCopyWithImpl;
  @useResult
  $Res call(
      {int version,
      UserContactData contactData,
      String languageCode,
      Map<String, dynamic> slangJson,
      bool hasChanges,
      bool isSubmitted,
      List<String> approvedKeys,
      String? lastSelectedKey});

  $UserContactDataCopyWith<$Res> get contactData;
}

/// @nodoc
class _$SlangBaseStateDataCopyWithImpl<$Res>
    implements $SlangBaseStateDataCopyWith<$Res> {
  _$SlangBaseStateDataCopyWithImpl(this._self, this._then);

  final SlangBaseStateData _self;
  final $Res Function(SlangBaseStateData) _then;

  /// Create a copy of SlangBaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
    Object? contactData = null,
    Object? languageCode = null,
    Object? slangJson = null,
    Object? hasChanges = null,
    Object? isSubmitted = null,
    Object? approvedKeys = null,
    Object? lastSelectedKey = freezed,
  }) {
    return _then(SlangBaseStateData(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      contactData: null == contactData
          ? _self.contactData
          : contactData // ignore: cast_nullable_to_non_nullable
              as UserContactData,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      slangJson: null == slangJson
          ? _self._slangJson
          : slangJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      hasChanges: null == hasChanges
          ? _self.hasChanges
          : hasChanges // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitted: null == isSubmitted
          ? _self.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      approvedKeys: null == approvedKeys
          ? _self._approvedKeys
          : approvedKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastSelectedKey: freezed == lastSelectedKey
          ? _self.lastSelectedKey
          : lastSelectedKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of SlangBaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserContactDataCopyWith<$Res> get contactData {
    return $UserContactDataCopyWith<$Res>(_self.contactData, (value) {
      return _then(_self.copyWith(contactData: value));
    });
  }
}

/// @nodoc
mixin _$UserContactData {
  String? get email;
  String? get name;
  String? get website;

  /// Create a copy of UserContactData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserContactDataCopyWith<UserContactData> get copyWith =>
      _$UserContactDataCopyWithImpl<UserContactData>(
          this as UserContactData, _$identity);

  /// Serializes this UserContactData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserContactData &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, name, website);

  @override
  String toString() {
    return 'UserContactData(email: $email, name: $name, website: $website)';
  }
}

/// @nodoc
abstract mixin class $UserContactDataCopyWith<$Res> {
  factory $UserContactDataCopyWith(
          UserContactData value, $Res Function(UserContactData) _then) =
      _$UserContactDataCopyWithImpl;
  @useResult
  $Res call({String? email, String? name, String? website});
}

/// @nodoc
class _$UserContactDataCopyWithImpl<$Res>
    implements $UserContactDataCopyWith<$Res> {
  _$UserContactDataCopyWithImpl(this._self, this._then);

  final UserContactData _self;
  final $Res Function(UserContactData) _then;

  /// Create a copy of UserContactData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? website = freezed,
  }) {
    return _then(_self.copyWith(
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserContactData].
extension UserContactDataPatterns on UserContactData {
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
    TResult Function(_UserContactData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserContactData() when $default != null:
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
    TResult Function(_UserContactData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserContactData():
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
    TResult? Function(_UserContactData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserContactData() when $default != null:
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
    TResult Function(String? email, String? name, String? website)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserContactData() when $default != null:
        return $default(_that.email, _that.name, _that.website);
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
    TResult Function(String? email, String? name, String? website) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserContactData():
        return $default(_that.email, _that.name, _that.website);
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
    TResult? Function(String? email, String? name, String? website)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserContactData() when $default != null:
        return $default(_that.email, _that.name, _that.website);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserContactData implements UserContactData {
  const _UserContactData({this.email, this.name, this.website});
  factory _UserContactData.fromJson(Map<String, dynamic> json) =>
      _$UserContactDataFromJson(json);

  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? website;

  /// Create a copy of UserContactData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserContactDataCopyWith<_UserContactData> get copyWith =>
      __$UserContactDataCopyWithImpl<_UserContactData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserContactDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserContactData &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, name, website);

  @override
  String toString() {
    return 'UserContactData(email: $email, name: $name, website: $website)';
  }
}

/// @nodoc
abstract mixin class _$UserContactDataCopyWith<$Res>
    implements $UserContactDataCopyWith<$Res> {
  factory _$UserContactDataCopyWith(
          _UserContactData value, $Res Function(_UserContactData) _then) =
      __$UserContactDataCopyWithImpl;
  @override
  @useResult
  $Res call({String? email, String? name, String? website});
}

/// @nodoc
class __$UserContactDataCopyWithImpl<$Res>
    implements _$UserContactDataCopyWith<$Res> {
  __$UserContactDataCopyWithImpl(this._self, this._then);

  final _UserContactData _self;
  final $Res Function(_UserContactData) _then;

  /// Create a copy of UserContactData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? website = freezed,
  }) {
    return _then(_UserContactData(
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
