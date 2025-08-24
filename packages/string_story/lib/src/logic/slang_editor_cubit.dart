import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_story/string_story.dart'
    show
        RemovePrefixExt,
        SlangBaseCubit,
        SlangBaseState,
        SlangBaseStateData,
        SlangEditorState,
        SlangEditorStateExt,
        StringStoryGeneratedDelegate,
        StringStoryService;

// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

class SlangEditorCubit extends Cubit<SlangEditorState> {
  SlangEditorCubit({
    required this.baseCubit,
    required Set<String> scopedKeys,
    required String ovLocale,
  })  : _ovLocale = ovLocale,
        super(SlangEditorState(scopedKeys: scopedKeys)) {
    _generatedDelegate = StringStoryService.instance.generatedDelegate;
    _subscription = baseCubit.stream.listen(onBaseCubitUpdate);
    _init();
  }

  late StringStoryGeneratedDelegate _generatedDelegate;

  Future<void> _init() async {
    final slangs = await Future.wait([
      SlangBaseCubit.load(
          StringStoryService.instance.generatedDelegate.baseLocale),
      SlangBaseCubit.load(_ovLocale),
    ]);
    _baseSlangJson = slangs[0];
    _ovSlangJson = slangs[1];
    onBaseCubitUpdate(baseCubit.state);
    final baseState = baseCubit.state;
    if (baseState is! SlangBaseStateData) {
      return;
    }
    final lastSelectedKey = baseState.lastSelectedKey;

    if (state.scopedKeys.isEmpty && lastSelectedKey != null) {
      final permittedKeys = _generatedDelegate.permittedKeys;
      if (permittedKeys.indexWhere((it) => it == lastSelectedKey) > -1) {
        emit(state.copyWith(scrollToKey: baseState.lastSelectedKey));
      }
    }
  }

  StreamSubscription<SlangBaseState>? _subscription;
  final SlangBaseCubit baseCubit;
  final String _ovLocale;
  Map<String, dynamic>? _baseSlangJson;
  Map<String, dynamic>? _ovSlangJson;

  void onBaseCubitUpdate(SlangBaseState baseState) {
    if (baseState is! SlangBaseStateData) {
      return;
    }

    final slangJsonScoped = <String, dynamic>{};
    final keys = state.scopedKeys.toList()..sort();

    for (final String key in keys) {
      if (baseState.slangJson[key] == null) {
        final effectiveKey = baseState.slangJson.keys
            .firstWhereOrNull((it) => it.removePrefix(key).startsWith("("));
        if (effectiveKey != null) {
          slangJsonScoped[effectiveKey] = baseState.slangJson[effectiveKey];
        }
      }
      slangJsonScoped[key] = baseState.slangJson[key];
    }

    emit(
      state
          .copyWith(
            slangJson: baseState.slangJson,
            slangScopedJson: slangJsonScoped,
            baseSlangJson: _baseSlangJson ?? state.baseSlangJson,
            ovSlangJson: _ovSlangJson ?? state.ovSlangJson,
          )
          .computeDiff(baseState),
    );
    _computeIndicies();
  }

  void resetKey(String slangKey) {
    baseCubit.applyChange({slangKey: state.ovSlangJson[slangKey]});
  }

  Future<void> selectKey(String? slangKey) async {
    emit(state.copyWith(selectedKey: slangKey, disablePreviewFocus: true));
  }

  void enableFocusPreview() {
    emit(state.copyWith(disablePreviewFocus: false));
  }

  var _indicies = <_Index>[];

  void _computeIndicies() {
    final localState = state;
    final localIndicies = <_Index>[];
    final permittedKeys = _generatedDelegate.permittedKeys;
    for (final key in permittedKeys) {
      final sb = StringBuffer();
      sb.writeIfNotNull(localState.slangJson[key]);
      // sb.writeIfNotNull(localState.enSlangJson[key.key]);
      // sb.writeIfNotNull(localState.ovSlangJson[key.key]);
      if (sb.isNotEmpty) {
        sb.writeString(key);
        localIndicies.add(_Index(key: key, combined: sb.toString()));
      }
    }
    _indicies = localIndicies;
  }

  void search(String query) {
    final queryNormalized = query.trim().toLowerCase();
    if (queryNormalized.isEmpty) {
      emit(state.copyWith(searchResults: []));
      return;
    }
    final results = _indicies
        .where((it) => it.combined.contains(queryNormalized))
        .map((it) => it.key)
        .toList();

    var nextState = state.copyWith(searchResults: results);

    if (nextState.searchResults.length == 1) {
      nextState =
          nextState.copyWith(scrollToKey: nextState.searchResults.first);
    }

    emit(nextState);
  }

  void moveSearchResult(int offset) {
    final localState = state;
    if (localState.searchResults.length < 2) {
      return;
    }
    final currentIndex = localState.searchResults
        .indexOf(localState.scrollToKey ?? localState.searchResults.first);
    final nextIndex = (currentIndex + offset) % localState.searchResults.length;
    emit(state.copyWith(scrollToKey: localState.searchResults[nextIndex]));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

class _Index extends Equatable {
  final String key;
  final String combined;

  const _Index({required this.key, required this.combined});

  @override
  List<Object?> get props => [key, combined];
}

extension _StringBuffer on StringBuffer {
  void writeIfNotNull(Object? value) {
    if (value == null) {
      return;
    }

    if (value is String) {
      writeString(value);
      return;
    }

    if (value is Map<String, dynamic>) {
      for (var it in value.values) {
        writeIfNotNull(it);
      }
    }
  }

  void writeString(String value) {
    write(value.trim().toLowerCase());
    write(" ");
  }
}
