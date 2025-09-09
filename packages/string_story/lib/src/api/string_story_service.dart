import 'package:flutter/widgets.dart';
import 'package:string_story/string_story.dart';

typedef StringStoryConfigListener = void Function(StringStoryConfig);

class StringStoryService {
  @visibleForTesting
  static void resetInstanceForTest() {
    _instance = null;
  }

  static StringStoryService? _instance;
  static StringStoryService get instance {
    if (_instance == null) {
      if (_builder == null) {
        throw StateError(
            "Did you forget to call StringStoryService.setBuilder ?");
      }
      _instance = _builder!();
    }
    return _instance!;
  }

  static StringStoryService Function()? _builder;

  static void setLazySingleton(StringStoryService Function() builder) {
    _builder = builder;
  }

  /// retrieves json from persistence given the [id]
  final Future<dynamic> Function(String id) getJsonById;

  /// saves json to persistence with the given [id]
  final Future<void> Function({
    required String id,
    required dynamic dataJson,
  }) putJsonById;

  final void Function(StringStoryServiceLogLevel level, String message)? log;

  /// configuration aspects used by [StringStoryScreen] and [LocaleEditorSheet]
  final InAppEditorConfig inAppEditorConfig;

  final ValueNotifier<StringStoryConfig> _stringStoryConfig;

  final StringStoryGeneratedDelegate generatedDelegate;

  StringStoryConfig get config => _stringStoryConfig.value;

  final _configListeners = <StringStoryConfigListener>{};

  void _onConfigUpdate() {
    final config = this.config;
    for (final listener in _configListeners) {
      listener(config);
    }
  }

  void addConfigListener(StringStoryConfigListener listener) {
    _configListeners.add(listener);
  }

  void removeConfigListener(StringStoryConfigListener listener) {
    _configListeners.remove(listener);
  }

  StringStoryService({
    required this.getJsonById,
    required this.putJsonById,
    required ValueNotifier<StringStoryConfig> stringStoryConfig,
    required this.generatedDelegate,
    required this.inAppEditorConfig,
    this.log,
  }) : _stringStoryConfig = stringStoryConfig {
    _stringStoryConfig.addListener(_onConfigUpdate);
  }

  void dispose() {
    _stringStoryConfig.removeListener(_onConfigUpdate);
  }
}

class InAppEditorConfig {
  /// called on entering [StringStoryScreen] a.k.a "Locale Editor"
  final VoidCallback? onEnter;

  /// called on exiting [StringStoryScreen] a.k.a "Locale Editor"
  final VoidCallback? onExit;

  final Widget Function(dynamic error)? buildErrorWidget;

  final VoidCallback? onTryTheApp;

  final WidgetBuilder? developerLogPaneBuilder;

  final UserContactData? Function() getUserContactData;
  final void Function(UserContactData) setUserContactData;

  final Future<void> Function(
          BuildContext context, SlangBaseStateData diffContent, int versionCode)
      submitTranslations;

  /// internal strings used by string_story package widgets
  final StringStoryInternalStrings strings;

  InAppEditorConfig({
    required this.buildErrorWidget,
    required this.getUserContactData,
    required this.setUserContactData,
    required this.submitTranslations,
    this.onEnter,
    this.onExit,
    this.onTryTheApp,
    this.developerLogPaneBuilder,
    this.strings = const StringStoryInternalStrings(),
  });
}

abstract class StringStoryGeneratedDelegate {
  Future<void> preload(Locale locale);
  void validateStateData(SlangBaseStateData state);
  List<String> get permittedKeys;
  int get versionCode;
  String get jsonAssetsPath;
  String get baseLocale;
}
