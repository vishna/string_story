import 'dart:io';

import 'package:test/test.dart';
import 'package:string_story_utils/src/translation_service.dart';
import 'package:string_story_utils/string_story_utils.dart';

class _DummyStringStoryConfig implements StringStoryConfig {
  _DummyStringStoryConfig({
    this.translationProvider,
    this.translationModel,
  });

  final String? translationProvider;
  final String? translationModel;

  // Implement other members as needed or throw UnimplementedError
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('TranslationService + Gemini', () {
    print("Hello from test group");
    final config = _DummyStringStoryConfig(
      translationProvider: "google",
      translationModel: "gemini-2.5-flash-lite",
    );

    const envFile = "test/test.env";
    if (!File(envFile).existsSync()) {
      print("Skipping test group - test.env not defined");
      return;
    }

    agentDotEnv(envFile);

    test('translates phrases (real network call)', () async {
      final input = ['Hello', 'World'];
      final result = await TranslationService.translate(
        inputPhrases: input,
        from: 'en',
        to: 'fr',
        stringStoryConfig: config,
      );
      expect(result.length, input.length);
      for (final phrase in result) {
        expect(phrase, isNotEmpty);
      }
      expect(result, ["Bonjour", "Monde"]);
    });
  });
}
