import 'package:test/test.dart';
import 'package:string_story_utils/src/translation_service.dart';
import 'package:string_story_utils/string_story_utils.dart';

class _DummyStringStoryConfig implements StringStoryConfig {
  _DummyStringStoryConfig({
    // ignore: unused_element_parameter
    this.translationProvider,
    // ignore: unused_element_parameter
    this.translationModel,
  });

  final String? translationProvider;
  final String? translationModel;

  // Implement other members as needed or throw UnimplementedError
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('TranslationService + No Provider', () {
    final config = _DummyStringStoryConfig();

    test('returns empty list when inputPhrases is empty', () async {
      final result = await TranslationService.translate(
        inputPhrases: [],
        from: 'en',
        to: 'fr',
        stringStoryConfig: config,
      );
      expect(result, isEmpty);
    });

    test('returns inputPhrases if provider is null', () async {
      final configNoProvider = _DummyStringStoryConfig();
      // ignore: invalid_use_of_visible_for_testing_member
      // This test expects the environment variable TRANSLATION_PROVIDER to be unset
      final result = await TranslationService.translate(
        inputPhrases: ['Hello', 'World'],
        from: 'en',
        to: 'fr',
        stringStoryConfig: configNoProvider,
      );
      expect(result, ['Hello', 'World']);
    });
  });
}
