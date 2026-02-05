import 'dart:convert';
import 'package:dartantic_ai/dartantic_ai.dart';
import 'package:string_story_utils/string_story_utils.dart';
import 'package:json_schema/json_schema.dart';

class TranslationService {
  TranslationService._();

  static Future<List<String>> translate({
    required List<String> inputPhrases,
    required String to,
    required String from,
    required StringStoryConfig stringStoryConfig,
  }) async {
    if (inputPhrases.isEmpty) return [];

    final provider = stringStoryConfig.translationProvider;
    final model = stringStoryConfig.translationModel;

    if (provider == null || !hasAnyAgentKey()) {
      log("Skipping translations: Missing provider or API Key.");
      return inputPhrases;
    }

    final effectiveModel = model != null ? "$provider:$model" : provider;

    // 1. Define the Response Schema
    final schemaMap = {
      "type": "object",
      "properties": {
        "translations": {
          "type": "array",
          "items": {"type": "string"},
          "description":
              "The translated strings maintaining order and special formatting."
        }
      },
      "required": ["translations"],
      "additionalProperties": false
    };

    final outputSchema = JsonSchema.create(schemaMap);

    // 2. Comprehensive System Instructions
    final systemPrompt = """
You are a professional localization engine. 
Translate the provided JSON phrases from ${getLanguageName(from)} to ${getLanguageName(to)}.

STRICT RULES:
1. Preserve newlines (\\n) exactly as they appear.
2. DO NOT translate placeholders starting with '\$' (e.g., \$name, \$count). Keep them exactly as-is.
3. Maintain the exact same order of phrases in the output list.
4. Output valid JSON only.
""";

    // 3. Prepare the Agent and Payload
    final agent = Agent(effectiveModel);

    final payload = {
      "context":
          "The following is a JSON object containing technical strings for translation.",
      "data": {
        "from": getLanguageName(from),
        "to": getLanguageName(to),
        "phrases": inputPhrases,
      }
    };

    final result = await agent.send(
      "${systemPrompt}\n\nInput Data:\n${jsonEncode(payload)}",
      outputSchema: outputSchema,
    );

    // 4. Decode and Validate
    final decoded = jsonDecode(result.output) as Map<String, dynamic>;
    final outputPhrases = (decoded["translations"] as List).cast<String>();

    if (outputPhrases.length != inputPhrases.length) {
      throw StateError(
        "Translation count mismatch: expected ${inputPhrases.length}, got ${outputPhrases.length}",
      );
    }

    return outputPhrases;
  }
}
