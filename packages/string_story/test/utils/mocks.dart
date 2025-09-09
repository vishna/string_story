import 'package:flutter/cupertino.dart';
import 'package:string_story/string_story.dart';

class _DummyDelegate implements StringStoryGeneratedDelegate {
  @override
  void validateStateData(state) {}
  @override
  List<String> get permittedKeys => [];
  @override
  int get versionCode => 1;

  @override
  Future<void> preload(Locale locale) async {}

  @override
  String get jsonAssetsPath => throw UnimplementedError();

  @override
  String get baseLocale => "en";
}

class MockStringStoryService extends StringStoryService {
  final List<String> logs = [];
  MockStringStoryService()
      : super(
          getJsonById: (_) async => null,
          putJsonById: ({required id, required dataJson}) async => null,
          inAppEditorConfig: InAppEditorConfig(
            buildErrorWidget: (_) => throw UnimplementedError(),
            getUserContactData: () => null,
            setUserContactData: (_) {},
            submitTranslations: (_, __, ___) async {},
          ),
          stringStoryConfig: ValueNotifier(StringStoryConfig(
              isEnabled: true, appLanguageCode: 'en', isDeveloper: false)),
          generatedDelegate: _DummyDelegate(),
        );

  @override
  void Function(StringStoryServiceLogLevel level, String message)? get log =>
      (level, message) => logs.add('[$level] $message');
}
