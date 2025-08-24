import 'dart:async';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_story/string_story.dart'
    show
        SlangBaseState,
        SlangBaseStateData,
        SlangBaseStateIdle,
        StringStoryConfig,
        StringStoryGeneratedDelegate,
        StringStoryLogger,
        StringStoryService,
        UserContactData;
import 'package:synchronized/synchronized.dart';

int get _slangStringsVersion =>
    StringStoryService.instance.generatedDelegate.versionCode;

class SlangBaseCubit extends Cubit<SlangBaseState> {
  SlangBaseCubit()
      : logger = StringStoryLogger("SlangBaseCubit"),
        super(const SlangBaseState.idle()) {
    stringStoryService = StringStoryService.instance;
    stringStoryService.addConfigListener(_onStringStoryConfigUpdate);
    _onStringStoryConfigUpdate(stringStoryService.config);
  }

  late StringStoryService stringStoryService;
  final StringStoryLogger logger;

  void _onStringStoryConfigUpdate(StringStoryConfig config) {
    if (!config.isEnabled) {
      emit(const SlangBaseState.idle());
    } else {
      _loadState(config);
    }
  }

  static String _slangBaseStateId(int version, String languageCode) =>
      "slangBaseState_${version}_$languageCode";

  Future<void> _loadState(StringStoryConfig config) async {
    final localState = state;
    final shouldLoadLanguage = switch (localState) {
      SlangBaseStateIdle() => true,
      SlangBaseStateData() => config.appLanguageCode != localState.languageCode,
    };

    if (!shouldLoadLanguage) {
      return;
    }

    bool isEnabled() => stringStoryService.config.isEnabled;

    final appLanguageCode = config.appLanguageCode;
    logger.d("loading ${appLanguageCode.toUpperCase()}");
    final persistedSlangState = await _loadFromPersistence(
      languageCode: appLanguageCode,
    );

    if (!isEnabled()) {
      emit(const SlangBaseState.idle());
    } else if (persistedSlangState != null) {
      emit(persistedSlangState);
      logger.d("loaded ${appLanguageCode.toUpperCase()} from persistence");
      return;
    }

    final assetSlang = await load(appLanguageCode);
    if (!isEnabled()) {
      emit(const SlangBaseState.idle());
    } else {
      emit(
        SlangBaseState.data(
          version: stringStoryService.generatedDelegate.versionCode,
          slangJson: assetSlang,
          languageCode: appLanguageCode,
          isSubmitted: false,
          hasChanges: false,
        ),
      );
      logger.d("loaded ${appLanguageCode.toUpperCase()} from assets");
    }
  }

  Future<SlangBaseStateData?> _loadFromPersistence({
    required String languageCode,
  }) async {
    try {
      final json = await StringStoryService.instance
          .getJsonById(_slangBaseStateId(_slangStringsVersion, languageCode));
      if (json != null) {
        final slangBaseData = SlangBaseStateData.fromJson(json);
        if (slangBaseData.version != _slangStringsVersion) {
          logger.d(
              "outdated ${languageCode.toUpperCase()} (OLD VERSION: ${slangBaseData.version}, CURRENT VERSION: $_slangStringsVersion)");
          return null;
        }
        return slangBaseData.copyWith(
            slangJson: Map<String, dynamic>.from(slangBaseData.slangJson)
              ..ensureOnlyStringKeys(stringStoryService.generatedDelegate));
      }
    } catch (e, s) {
      logger.e(
        "_loadFromPersistence FAIL for ${languageCode.toUpperCase()}",
        error: e,
        stackTrace: s,
      );
    }
    return null;
  }

  final _saveToPersistenceLock = Lock();

  Future<void> _saveToPersistence(SlangBaseStateData data) async {
    await _saveToPersistenceLock.synchronized(() async {
      await StringStoryService.instance.putJsonById(
        id: _slangBaseStateId(_slangStringsVersion, data.languageCode),
        dataJson: data.toJson(),
      );
      logger.d("_saveToPersistence(${data.languageCode.toUpperCase()})");
    });
  }

  String exportDiffFilename() {
    final localState = state;
    if (localState is! SlangBaseStateData) {
      throw StateError("wrong state $localState");
    }

    return "translamore-locale${localState.languageCode.toUpperCase()}-v${localState.version}.json";
  }

  Future<SlangBaseStateData> exportDiffContent() async {
    final localState = state;
    if (localState is! SlangBaseStateData) {
      throw StateError("wrong state $localState");
    }

    final ovMap = await load(localState.languageCode);

    final diffState = localState.copyWith(
      slangJson: _computeDiff(
        ov: ovMap,
        applied: localState.slangJson,
      ),
      lastSelectedKey: null,
    );
    return diffState;
  }

  static Future<Map<String, dynamic>> load(String underscoreTag) async {
    var result = _loadCache[underscoreTag];
    if (result == null) {
      final fileName = "$underscoreTag.i18n.json";
      final jsonContent = await rootBundle.loadString(
          '${StringStoryService.instance.generatedDelegate.jsonAssetsPath}/$fileName');
      result = await compute(_jsonMapDecode, jsonContent);
      _loadCache[underscoreTag] = result!;
    }
    return result;
  }

  static final _loadCache = <String, Map<String, dynamic>>{};

  static Map<String, dynamic> _jsonMapDecode(String message) {
    return jsonDecode(message);
  }

  @override
  Future<void> close() {
    stringStoryService.removeConfigListener(_onStringStoryConfigUpdate);
    return super.close();
  }

  Future<void> applyChange(Map<String, dynamic> value) async {
    final localState = state;
    if (localState is SlangBaseStateData) {
      var nextState = localState.copyWith(
        slangJson: {
          ...await deepCopyAsync(localState.slangJson),
          ...await deepCopyAsync(value)
        }..ensureOnlyStringKeys(stringStoryService.generatedDelegate),
      );

      final ov = await load(localState.languageCode);
      final hasAnyChanges = _dc.equals(ov, nextState.slangJson);
      nextState = nextState.copyWith(hasChanges: !hasAnyChanges);

      if (nextState.isSubmitted) {
        final hasApplyChanges =
            _dc.equals(localState.slangJson, nextState.slangJson);
        if (hasApplyChanges) {
          nextState = nextState.copyWith(isSubmitted: false);
        }
      }

      try {
        // PROTECT BEFORE ACCIDENTAL SCREEN OF DEATH
        stringStoryService.generatedDelegate.validateStateData(nextState);
        emit(nextState);
        _saveToPersistence(nextState);
      } catch (e, s) {
        logger.e("Failed to compute delegate", error: e, stackTrace: s);
      }
    }
  }

  void setContactData(UserContactData contactData) {
    final localState = state;
    if (localState is SlangBaseStateData) {
      final nextState = localState.copyWith(
        contactData: contactData,
      );
      emit(nextState);
      _saveToPersistence(nextState);
    }
  }

  void markSubmitted() {
    final localState = state;
    if (localState is SlangBaseStateData) {
      final nextState = localState.copyWith(isSubmitted: true);
      emit(nextState);
      _saveToPersistence(nextState);
    }
  }

  void approveKey(String key) {
    final localState = state;
    if (localState is SlangBaseStateData) {
      final nextApprovedKeys = List<String>.from(localState.approvedKeys);
      if (nextApprovedKeys.contains(key)) {
        return;
      }
      nextApprovedKeys.add(key);
      final nextState = localState.copyWith(approvedKeys: nextApprovedKeys);
      emit(nextState);
      _saveToPersistence(nextState);
    }
  }

  void unapproveKey(String key) {
    final localState = state;
    if (localState is SlangBaseStateData) {
      final nextApprovedKeys = List<String>.from(localState.approvedKeys);
      if (!nextApprovedKeys.contains(key)) {
        return;
      }
      nextApprovedKeys.remove(key);
      final nextState = localState.copyWith(approvedKeys: nextApprovedKeys);
      emit(nextState);
      _saveToPersistence(nextState);
    }
  }

  void setLastSelectedKey(String? key) {
    final localState = state;
    if (localState is SlangBaseStateData) {
      final nextState = localState.copyWith(lastSelectedKey: key);
      emit(nextState);
      _saveToPersistence(nextState);
    }
  }
}

Future<Map<String, dynamic>> deepCopyAsync(Map<String, dynamic> input) {
  return compute(_deepCopy, input);
}

Map<String, dynamic> _deepCopy(Map<String, dynamic> input) {
  return jsonDecode(jsonEncode(input));
}

Map<String, dynamic> _computeDiff({
  required Map<String, dynamic> ov,
  required Map<String, dynamic> applied,
}) {
  final allKeys = ov.keys.toList()..sort();
  final diffMap = <String, dynamic>{};
  for (final key in allKeys) {
    final ovValue = ov[key];
    final editedValue = applied[key];
    if (!_dc.equals(ovValue, editedValue)) {
      diffMap[key] = editedValue;
    }
  }
  return diffMap;
}

const _dc = DeepCollectionEquality();

extension _MapSanitize on Map<String, dynamic> {
  void ensureOnlyStringKeys(StringStoryGeneratedDelegate generatedDelegate) {
    final availableKeys = keys.toList();
    //final permittedKeys = StringKey.values.map((it) => it.key).toList();
    final permittedKeys = generatedDelegate.permittedKeys;
    final keysToRemove = List.from(availableKeys)
      ..removeWhere((it) => permittedKeys.contains(it));
    for (final keyToRemove in keysToRemove) {
      remove(keyToRemove);
    }
  }
}
