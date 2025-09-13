// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slang_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SlangEditorState {
  /// current live locale file
  Map<String, dynamic> get slangJson;

  /// current live locale file (scoped)
  Map<String, dynamic> get slangScopedJson;

  /// the base language unmodified locale file
  Map<String, dynamic> get baseSlangJson;

  /// current language unmodified locale file
  Map<String, dynamic> get ovSlangJson;
  Set<String> get scopedKeys;
  List<String> get diffKeys;
  String? get selectedKey;
  String? get scrollToKey;
  bool get disablePreviewFocus;
  List<String> get searchResults;
  double get progress;

  /// Create a copy of SlangEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SlangEditorStateCopyWith<SlangEditorState> get copyWith =>
      _$SlangEditorStateCopyWithImpl<SlangEditorState>(
          this as SlangEditorState, _$identity);

  /// Serializes this SlangEditorState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SlangEditorState &&
            const DeepCollectionEquality().equals(other.slangJson, slangJson) &&
            const DeepCollectionEquality()
                .equals(other.slangScopedJson, slangScopedJson) &&
            const DeepCollectionEquality()
                .equals(other.baseSlangJson, baseSlangJson) &&
            const DeepCollectionEquality()
                .equals(other.ovSlangJson, ovSlangJson) &&
            const DeepCollectionEquality()
                .equals(other.scopedKeys, scopedKeys) &&
            const DeepCollectionEquality().equals(other.diffKeys, diffKeys) &&
            (identical(other.selectedKey, selectedKey) ||
                other.selectedKey == selectedKey) &&
            (identical(other.scrollToKey, scrollToKey) ||
                other.scrollToKey == scrollToKey) &&
            (identical(other.disablePreviewFocus, disablePreviewFocus) ||
                other.disablePreviewFocus == disablePreviewFocus) &&
            const DeepCollectionEquality()
                .equals(other.searchResults, searchResults) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(slangJson),
      const DeepCollectionEquality().hash(slangScopedJson),
      const DeepCollectionEquality().hash(baseSlangJson),
      const DeepCollectionEquality().hash(ovSlangJson),
      const DeepCollectionEquality().hash(scopedKeys),
      const DeepCollectionEquality().hash(diffKeys),
      selectedKey,
      scrollToKey,
      disablePreviewFocus,
      const DeepCollectionEquality().hash(searchResults),
      progress);

  @override
  String toString() {
    return 'SlangEditorState(slangJson: $slangJson, slangScopedJson: $slangScopedJson, baseSlangJson: $baseSlangJson, ovSlangJson: $ovSlangJson, scopedKeys: $scopedKeys, diffKeys: $diffKeys, selectedKey: $selectedKey, scrollToKey: $scrollToKey, disablePreviewFocus: $disablePreviewFocus, searchResults: $searchResults, progress: $progress)';
  }
}

/// @nodoc
abstract mixin class $SlangEditorStateCopyWith<$Res> {
  factory $SlangEditorStateCopyWith(
          SlangEditorState value, $Res Function(SlangEditorState) _then) =
      _$SlangEditorStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, dynamic> slangJson,
      Map<String, dynamic> slangScopedJson,
      Map<String, dynamic> baseSlangJson,
      Map<String, dynamic> ovSlangJson,
      Set<String> scopedKeys,
      List<String> diffKeys,
      String? selectedKey,
      String? scrollToKey,
      bool disablePreviewFocus,
      List<String> searchResults,
      double progress});
}

/// @nodoc
class _$SlangEditorStateCopyWithImpl<$Res>
    implements $SlangEditorStateCopyWith<$Res> {
  _$SlangEditorStateCopyWithImpl(this._self, this._then);

  final SlangEditorState _self;
  final $Res Function(SlangEditorState) _then;

  /// Create a copy of SlangEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slangJson = null,
    Object? slangScopedJson = null,
    Object? baseSlangJson = null,
    Object? ovSlangJson = null,
    Object? scopedKeys = null,
    Object? diffKeys = null,
    Object? selectedKey = freezed,
    Object? scrollToKey = freezed,
    Object? disablePreviewFocus = null,
    Object? searchResults = null,
    Object? progress = null,
  }) {
    return _then(_self.copyWith(
      slangJson: null == slangJson
          ? _self.slangJson
          : slangJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      slangScopedJson: null == slangScopedJson
          ? _self.slangScopedJson
          : slangScopedJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      baseSlangJson: null == baseSlangJson
          ? _self.baseSlangJson
          : baseSlangJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ovSlangJson: null == ovSlangJson
          ? _self.ovSlangJson
          : ovSlangJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      scopedKeys: null == scopedKeys
          ? _self.scopedKeys
          : scopedKeys // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      diffKeys: null == diffKeys
          ? _self.diffKeys
          : diffKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedKey: freezed == selectedKey
          ? _self.selectedKey
          : selectedKey // ignore: cast_nullable_to_non_nullable
              as String?,
      scrollToKey: freezed == scrollToKey
          ? _self.scrollToKey
          : scrollToKey // ignore: cast_nullable_to_non_nullable
              as String?,
      disablePreviewFocus: null == disablePreviewFocus
          ? _self.disablePreviewFocus
          : disablePreviewFocus // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResults: null == searchResults
          ? _self.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<String>,
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [SlangEditorState].
extension SlangEditorStatePatterns on SlangEditorState {
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
    TResult Function(_SlangEditorState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SlangEditorState() when $default != null:
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
    TResult Function(_SlangEditorState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SlangEditorState():
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
    TResult? Function(_SlangEditorState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SlangEditorState() when $default != null:
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
    TResult Function(
            Map<String, dynamic> slangJson,
            Map<String, dynamic> slangScopedJson,
            Map<String, dynamic> baseSlangJson,
            Map<String, dynamic> ovSlangJson,
            Set<String> scopedKeys,
            List<String> diffKeys,
            String? selectedKey,
            String? scrollToKey,
            bool disablePreviewFocus,
            List<String> searchResults,
            double progress)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SlangEditorState() when $default != null:
        return $default(
            _that.slangJson,
            _that.slangScopedJson,
            _that.baseSlangJson,
            _that.ovSlangJson,
            _that.scopedKeys,
            _that.diffKeys,
            _that.selectedKey,
            _that.scrollToKey,
            _that.disablePreviewFocus,
            _that.searchResults,
            _that.progress);
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
    TResult Function(
            Map<String, dynamic> slangJson,
            Map<String, dynamic> slangScopedJson,
            Map<String, dynamic> baseSlangJson,
            Map<String, dynamic> ovSlangJson,
            Set<String> scopedKeys,
            List<String> diffKeys,
            String? selectedKey,
            String? scrollToKey,
            bool disablePreviewFocus,
            List<String> searchResults,
            double progress)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SlangEditorState():
        return $default(
            _that.slangJson,
            _that.slangScopedJson,
            _that.baseSlangJson,
            _that.ovSlangJson,
            _that.scopedKeys,
            _that.diffKeys,
            _that.selectedKey,
            _that.scrollToKey,
            _that.disablePreviewFocus,
            _that.searchResults,
            _that.progress);
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
    TResult? Function(
            Map<String, dynamic> slangJson,
            Map<String, dynamic> slangScopedJson,
            Map<String, dynamic> baseSlangJson,
            Map<String, dynamic> ovSlangJson,
            Set<String> scopedKeys,
            List<String> diffKeys,
            String? selectedKey,
            String? scrollToKey,
            bool disablePreviewFocus,
            List<String> searchResults,
            double progress)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SlangEditorState() when $default != null:
        return $default(
            _that.slangJson,
            _that.slangScopedJson,
            _that.baseSlangJson,
            _that.ovSlangJson,
            _that.scopedKeys,
            _that.diffKeys,
            _that.selectedKey,
            _that.scrollToKey,
            _that.disablePreviewFocus,
            _that.searchResults,
            _that.progress);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SlangEditorState implements SlangEditorState {
  _SlangEditorState(
      {final Map<String, dynamic> slangJson = const {},
      final Map<String, dynamic> slangScopedJson = const {},
      final Map<String, dynamic> baseSlangJson = const {},
      final Map<String, dynamic> ovSlangJson = const {},
      final Set<String> scopedKeys = const {},
      final List<String> diffKeys = const [],
      this.selectedKey,
      this.scrollToKey,
      this.disablePreviewFocus = true,
      final List<String> searchResults = const [],
      this.progress = 0.0})
      : _slangJson = slangJson,
        _slangScopedJson = slangScopedJson,
        _baseSlangJson = baseSlangJson,
        _ovSlangJson = ovSlangJson,
        _scopedKeys = scopedKeys,
        _diffKeys = diffKeys,
        _searchResults = searchResults;
  factory _SlangEditorState.fromJson(Map<String, dynamic> json) =>
      _$SlangEditorStateFromJson(json);

  /// current live locale file
  final Map<String, dynamic> _slangJson;

  /// current live locale file
  @override
  @JsonKey()
  Map<String, dynamic> get slangJson {
    if (_slangJson is EqualUnmodifiableMapView) return _slangJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_slangJson);
  }

  /// current live locale file (scoped)
  final Map<String, dynamic> _slangScopedJson;

  /// current live locale file (scoped)
  @override
  @JsonKey()
  Map<String, dynamic> get slangScopedJson {
    if (_slangScopedJson is EqualUnmodifiableMapView) return _slangScopedJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_slangScopedJson);
  }

  /// the base language unmodified locale file
  final Map<String, dynamic> _baseSlangJson;

  /// the base language unmodified locale file
  @override
  @JsonKey()
  Map<String, dynamic> get baseSlangJson {
    if (_baseSlangJson is EqualUnmodifiableMapView) return _baseSlangJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_baseSlangJson);
  }

  /// current language unmodified locale file
  final Map<String, dynamic> _ovSlangJson;

  /// current language unmodified locale file
  @override
  @JsonKey()
  Map<String, dynamic> get ovSlangJson {
    if (_ovSlangJson is EqualUnmodifiableMapView) return _ovSlangJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ovSlangJson);
  }

  final Set<String> _scopedKeys;
  @override
  @JsonKey()
  Set<String> get scopedKeys {
    if (_scopedKeys is EqualUnmodifiableSetView) return _scopedKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_scopedKeys);
  }

  final List<String> _diffKeys;
  @override
  @JsonKey()
  List<String> get diffKeys {
    if (_diffKeys is EqualUnmodifiableListView) return _diffKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diffKeys);
  }

  @override
  final String? selectedKey;
  @override
  final String? scrollToKey;
  @override
  @JsonKey()
  final bool disablePreviewFocus;
  final List<String> _searchResults;
  @override
  @JsonKey()
  List<String> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  @JsonKey()
  final double progress;

  /// Create a copy of SlangEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SlangEditorStateCopyWith<_SlangEditorState> get copyWith =>
      __$SlangEditorStateCopyWithImpl<_SlangEditorState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SlangEditorStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SlangEditorState &&
            const DeepCollectionEquality()
                .equals(other._slangJson, _slangJson) &&
            const DeepCollectionEquality()
                .equals(other._slangScopedJson, _slangScopedJson) &&
            const DeepCollectionEquality()
                .equals(other._baseSlangJson, _baseSlangJson) &&
            const DeepCollectionEquality()
                .equals(other._ovSlangJson, _ovSlangJson) &&
            const DeepCollectionEquality()
                .equals(other._scopedKeys, _scopedKeys) &&
            const DeepCollectionEquality().equals(other._diffKeys, _diffKeys) &&
            (identical(other.selectedKey, selectedKey) ||
                other.selectedKey == selectedKey) &&
            (identical(other.scrollToKey, scrollToKey) ||
                other.scrollToKey == scrollToKey) &&
            (identical(other.disablePreviewFocus, disablePreviewFocus) ||
                other.disablePreviewFocus == disablePreviewFocus) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_slangJson),
      const DeepCollectionEquality().hash(_slangScopedJson),
      const DeepCollectionEquality().hash(_baseSlangJson),
      const DeepCollectionEquality().hash(_ovSlangJson),
      const DeepCollectionEquality().hash(_scopedKeys),
      const DeepCollectionEquality().hash(_diffKeys),
      selectedKey,
      scrollToKey,
      disablePreviewFocus,
      const DeepCollectionEquality().hash(_searchResults),
      progress);

  @override
  String toString() {
    return 'SlangEditorState(slangJson: $slangJson, slangScopedJson: $slangScopedJson, baseSlangJson: $baseSlangJson, ovSlangJson: $ovSlangJson, scopedKeys: $scopedKeys, diffKeys: $diffKeys, selectedKey: $selectedKey, scrollToKey: $scrollToKey, disablePreviewFocus: $disablePreviewFocus, searchResults: $searchResults, progress: $progress)';
  }
}

/// @nodoc
abstract mixin class _$SlangEditorStateCopyWith<$Res>
    implements $SlangEditorStateCopyWith<$Res> {
  factory _$SlangEditorStateCopyWith(
          _SlangEditorState value, $Res Function(_SlangEditorState) _then) =
      __$SlangEditorStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> slangJson,
      Map<String, dynamic> slangScopedJson,
      Map<String, dynamic> baseSlangJson,
      Map<String, dynamic> ovSlangJson,
      Set<String> scopedKeys,
      List<String> diffKeys,
      String? selectedKey,
      String? scrollToKey,
      bool disablePreviewFocus,
      List<String> searchResults,
      double progress});
}

/// @nodoc
class __$SlangEditorStateCopyWithImpl<$Res>
    implements _$SlangEditorStateCopyWith<$Res> {
  __$SlangEditorStateCopyWithImpl(this._self, this._then);

  final _SlangEditorState _self;
  final $Res Function(_SlangEditorState) _then;

  /// Create a copy of SlangEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? slangJson = null,
    Object? slangScopedJson = null,
    Object? baseSlangJson = null,
    Object? ovSlangJson = null,
    Object? scopedKeys = null,
    Object? diffKeys = null,
    Object? selectedKey = freezed,
    Object? scrollToKey = freezed,
    Object? disablePreviewFocus = null,
    Object? searchResults = null,
    Object? progress = null,
  }) {
    return _then(_SlangEditorState(
      slangJson: null == slangJson
          ? _self._slangJson
          : slangJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      slangScopedJson: null == slangScopedJson
          ? _self._slangScopedJson
          : slangScopedJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      baseSlangJson: null == baseSlangJson
          ? _self._baseSlangJson
          : baseSlangJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ovSlangJson: null == ovSlangJson
          ? _self._ovSlangJson
          : ovSlangJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      scopedKeys: null == scopedKeys
          ? _self._scopedKeys
          : scopedKeys // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      diffKeys: null == diffKeys
          ? _self._diffKeys
          : diffKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedKey: freezed == selectedKey
          ? _self.selectedKey
          : selectedKey // ignore: cast_nullable_to_non_nullable
              as String?,
      scrollToKey: freezed == scrollToKey
          ? _self.scrollToKey
          : scrollToKey // ignore: cast_nullable_to_non_nullable
              as String?,
      disablePreviewFocus: null == disablePreviewFocus
          ? _self.disablePreviewFocus
          : disablePreviewFocus // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResults: null == searchResults
          ? _self._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<String>,
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
