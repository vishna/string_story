import 'package:dartantic_ai/dartantic_ai.dart';
import 'package:mustache_template/mustache.dart';
import 'package:string_story_utils/src/assets.dart';
import 'package:string_story_utils/string_story_utils.dart';

class TranslationService {
  TranslationService._();

  static Future<List<String>> translate({
    required List<String> inputPhrases,

    /// language code of the input phrases
    required String to,

    /// language code of the output phrases
    required String from,
    required StringStoryConfig stringStoryConfig,
  }) async {
    if (inputPhrases.isEmpty) {
      return [];
    }

    final template = Template(
      Assets.assets_generate_translations_prompt_mustache,
      lenient: true,
    );

    final text = inputPhrases.join("\n").trim();

    final effectivePrompt = template.renderString({
      "from": getLanguageName(from),
      "to": getLanguageName(to),
      "text": text,
    });

    // Pick provider from env var, default to OpenAI if not set
    final provider = stringStoryConfig.translationProvider;
    final model = stringStoryConfig.translationModel;

    if (provider == null) {
      log("Skipping translations, no translation_provider set.");
      return inputPhrases;
    }

    if (!hasAnyAgentKey()) {
      log("Skipping translations, no API KEY for any provider set.");
      return inputPhrases;
    }

    final effectiveModel = StringBuffer()..write(provider);
    if (model != null) {
      effectiveModel
        ..write(":")
        ..write(model);
    }

    final agent = Agent(effectiveModel.toString());
    final result = await agent.send(effectivePrompt);
    final outputString = result.output;

    final outputPhrases = outputString.trim().split("\n");

    if (inputPhrases.length != outputPhrases.length) {
      throw StateError(
        "Translation count mismatch: expected ${inputPhrases.length}, got ${outputPhrases.length}",
      );
    }

    assert(inputPhrases.length == outputPhrases.length);

    return outputPhrases;
  }
}
