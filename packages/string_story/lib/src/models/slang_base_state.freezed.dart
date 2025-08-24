// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slang_base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SlangBaseStateIdle value) idle,
    required TResult Function(SlangBaseStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SlangBaseStateIdle value)? idle,
    TResult? Function(SlangBaseStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SlangBaseStateIdle value)? idle,
    TResult Function(SlangBaseStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this SlangBaseState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlangBaseStateCopyWith<$Res> {
  factory $SlangBaseStateCopyWith(
          SlangBaseState value, $Res Function(SlangBaseState) then) =
      _$SlangBaseStateCopyWithImpl<$Res, SlangBaseState>;
}

/// @nodoc
class _$SlangBaseStateCopyWithImpl<$Res, $Val extends SlangBaseState>
    implements $SlangBaseStateCopyWith<$Res> {
  _$SlangBaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SlangBaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SlangBaseStateIdleImplCopyWith<$Res> {
  factory _$$SlangBaseStateIdleImplCopyWith(_$SlangBaseStateIdleImpl value,
          $Res Function(_$SlangBaseStateIdleImpl) then) =
      __$$SlangBaseStateIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SlangBaseStateIdleImplCopyWithImpl<$Res>
    extends _$SlangBaseStateCopyWithImpl<$Res, _$SlangBaseStateIdleImpl>
    implements _$$SlangBaseStateIdleImplCopyWith<$Res> {
  __$$SlangBaseStateIdleImplCopyWithImpl(_$SlangBaseStateIdleImpl _value,
      $Res Function(_$SlangBaseStateIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of SlangBaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SlangBaseStateIdleImpl implements SlangBaseStateIdle {
  const _$SlangBaseStateIdleImpl({final String? $type})
      : $type = $type ?? 'idle';

  factory _$SlangBaseStateIdleImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlangBaseStateIdleImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SlangBaseState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SlangBaseStateIdleImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return idle();
  }

  @override
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
    return idle?.call();
  }

  @override
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
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SlangBaseStateIdle value) idle,
    required TResult Function(SlangBaseStateData value) data,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SlangBaseStateIdle value)? idle,
    TResult? Function(SlangBaseStateData value)? data,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SlangBaseStateIdle value)? idle,
    TResult Function(SlangBaseStateData value)? data,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SlangBaseStateIdleImplToJson(
      this,
    );
  }
}

abstract class SlangBaseStateIdle implements SlangBaseState {
  const factory SlangBaseStateIdle() = _$SlangBaseStateIdleImpl;

  factory SlangBaseStateIdle.fromJson(Map<String, dynamic> json) =
      _$SlangBaseStateIdleImpl.fromJson;
}

/// @nodoc
abstract class _$$SlangBaseStateDataImplCopyWith<$Res> {
  factory _$$SlangBaseStateDataImplCopyWith(_$SlangBaseStateDataImpl value,
          $Res Function(_$SlangBaseStateDataImpl) then) =
      __$$SlangBaseStateDataImplCopyWithImpl<$Res>;
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
class __$$SlangBaseStateDataImplCopyWithImpl<$Res>
    extends _$SlangBaseStateCopyWithImpl<$Res, _$SlangBaseStateDataImpl>
    implements _$$SlangBaseStateDataImplCopyWith<$Res> {
  __$$SlangBaseStateDataImplCopyWithImpl(_$SlangBaseStateDataImpl _value,
      $Res Function(_$SlangBaseStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SlangBaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
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
    return _then(_$SlangBaseStateDataImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      contactData: null == contactData
          ? _value.contactData
          : contactData // ignore: cast_nullable_to_non_nullable
              as UserContactData,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      slangJson: null == slangJson
          ? _value._slangJson
          : slangJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      hasChanges: null == hasChanges
          ? _value.hasChanges
          : hasChanges // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitted: null == isSubmitted
          ? _value.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      approvedKeys: null == approvedKeys
          ? _value._approvedKeys
          : approvedKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastSelectedKey: freezed == lastSelectedKey
          ? _value.lastSelectedKey
          : lastSelectedKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of SlangBaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserContactDataCopyWith<$Res> get contactData {
    return $UserContactDataCopyWith<$Res>(_value.contactData, (value) {
      return _then(_value.copyWith(contactData: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$SlangBaseStateDataImpl implements SlangBaseStateData {
  const _$SlangBaseStateDataImpl(
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

  factory _$SlangBaseStateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlangBaseStateDataImplFromJson(json);

  @override
  final int version;
  @override
  @JsonKey()
  final UserContactData contactData;
  @override
  final String languageCode;
  final Map<String, dynamic> _slangJson;
  @override
  Map<String, dynamic> get slangJson {
    if (_slangJson is EqualUnmodifiableMapView) return _slangJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_slangJson);
  }

  @override
  final bool hasChanges;
  @override
  final bool isSubmitted;
  final List<String> _approvedKeys;
  @override
  @JsonKey()
  List<String> get approvedKeys {
    if (_approvedKeys is EqualUnmodifiableListView) return _approvedKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approvedKeys);
  }

  @override
  final String? lastSelectedKey;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SlangBaseState.data(version: $version, contactData: $contactData, languageCode: $languageCode, slangJson: $slangJson, hasChanges: $hasChanges, isSubmitted: $isSubmitted, approvedKeys: $approvedKeys, lastSelectedKey: $lastSelectedKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlangBaseStateDataImpl &&
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

  /// Create a copy of SlangBaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlangBaseStateDataImplCopyWith<_$SlangBaseStateDataImpl> get copyWith =>
      __$$SlangBaseStateDataImplCopyWithImpl<_$SlangBaseStateDataImpl>(
          this, _$identity);

  @override
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
    return data(version, contactData, languageCode, slangJson, hasChanges,
        isSubmitted, approvedKeys, lastSelectedKey);
  }

  @override
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
    return data?.call(version, contactData, languageCode, slangJson, hasChanges,
        isSubmitted, approvedKeys, lastSelectedKey);
  }

  @override
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
    if (data != null) {
      return data(version, contactData, languageCode, slangJson, hasChanges,
          isSubmitted, approvedKeys, lastSelectedKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SlangBaseStateIdle value) idle,
    required TResult Function(SlangBaseStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SlangBaseStateIdle value)? idle,
    TResult? Function(SlangBaseStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SlangBaseStateIdle value)? idle,
    TResult Function(SlangBaseStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SlangBaseStateDataImplToJson(
      this,
    );
  }
}

abstract class SlangBaseStateData implements SlangBaseState {
  const factory SlangBaseStateData(
      {required final int version,
      final UserContactData contactData,
      required final String languageCode,
      required final Map<String, dynamic> slangJson,
      required final bool hasChanges,
      required final bool isSubmitted,
      final List<String> approvedKeys,
      final String? lastSelectedKey}) = _$SlangBaseStateDataImpl;

  factory SlangBaseStateData.fromJson(Map<String, dynamic> json) =
      _$SlangBaseStateDataImpl.fromJson;

  int get version;
  UserContactData get contactData;
  String get languageCode;
  Map<String, dynamic> get slangJson;
  bool get hasChanges;
  bool get isSubmitted;
  List<String> get approvedKeys;
  String? get lastSelectedKey;

  /// Create a copy of SlangBaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlangBaseStateDataImplCopyWith<_$SlangBaseStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserContactData _$UserContactDataFromJson(Map<String, dynamic> json) {
  return _UserContactData.fromJson(json);
}

/// @nodoc
mixin _$UserContactData {
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;

  /// Serializes this UserContactData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserContactData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserContactDataCopyWith<UserContactData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContactDataCopyWith<$Res> {
  factory $UserContactDataCopyWith(
          UserContactData value, $Res Function(UserContactData) then) =
      _$UserContactDataCopyWithImpl<$Res, UserContactData>;
  @useResult
  $Res call({String? email, String? name, String? website});
}

/// @nodoc
class _$UserContactDataCopyWithImpl<$Res, $Val extends UserContactData>
    implements $UserContactDataCopyWith<$Res> {
  _$UserContactDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserContactData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? website = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserContactDataImplCopyWith<$Res>
    implements $UserContactDataCopyWith<$Res> {
  factory _$$UserContactDataImplCopyWith(_$UserContactDataImpl value,
          $Res Function(_$UserContactDataImpl) then) =
      __$$UserContactDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? name, String? website});
}

/// @nodoc
class __$$UserContactDataImplCopyWithImpl<$Res>
    extends _$UserContactDataCopyWithImpl<$Res, _$UserContactDataImpl>
    implements _$$UserContactDataImplCopyWith<$Res> {
  __$$UserContactDataImplCopyWithImpl(
      _$UserContactDataImpl _value, $Res Function(_$UserContactDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserContactData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? website = freezed,
  }) {
    return _then(_$UserContactDataImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserContactDataImpl implements _UserContactData {
  const _$UserContactDataImpl({this.email, this.name, this.website});

  factory _$UserContactDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserContactDataImplFromJson(json);

  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? website;

  @override
  String toString() {
    return 'UserContactData(email: $email, name: $name, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserContactDataImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, name, website);

  /// Create a copy of UserContactData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserContactDataImplCopyWith<_$UserContactDataImpl> get copyWith =>
      __$$UserContactDataImplCopyWithImpl<_$UserContactDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserContactDataImplToJson(
      this,
    );
  }
}

abstract class _UserContactData implements UserContactData {
  const factory _UserContactData(
      {final String? email,
      final String? name,
      final String? website}) = _$UserContactDataImpl;

  factory _UserContactData.fromJson(Map<String, dynamic> json) =
      _$UserContactDataImpl.fromJson;

  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get website;

  /// Create a copy of UserContactData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserContactDataImplCopyWith<_$UserContactDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
