# string_story_utils

Developer tools and code generators for the [string_story](../string_story) package.

## Features

- **Doctor**: Validates your app's localization setup.
- **Generate**: Generates code for string management and integration.
- **Align**: Manages string key additions/removals, with optional auto-translation via `dartantic_ai`.
- **Apply Diff**: Applies string JSON exported from the String Story editor back into your project.

### Usage

Run scripts using Dart:

```sh
dart run string_story_utils:doctor
dart run string_story_utils:generate
dart run string_story_utils:align
dart run string_story_utils:apply_diff
```

#### Align

Scans base localization file and aligns all other translations files:

- All JSON keys are sorted alphabetically
- Keys that are not in the base file will be removed from translations
- Keys that are in the base file but are not in the translations will be added
  - if auto-translation is enabled, translation will be generated
  - if auto-translation is not enabled, base language version will be copied
- A fingerprint (hash) file will be generated for every locale file
  - whenever you change a key in the source file, other translations will be retranslated

#### Align + Auto-Translate

Make sure your `slang.yaml` string_story section has `translation_provider` (and optionally `translation_model`). You can specify your `env_file`.

```yaml
string_story:
  translation_provider: openai
  translation_model: gpt-4o
  env_file: .mysecrets.env # defaults to .env if not provided
```

List of providers/models can be found here: https://docs.dartantic.ai/providers#provider-configuration

Following keys should be picked up from your `env_file` file. Make sure you have the right key for the provider/model you intend to use.

```sh
OPENAI_API_KEY
ANTHROPIC_API_KEY
GEMINI_API_KEY
MISTRAL_API_KEY
COHERE_API_KEY
OPENROUTER_API_KEY
TOGETHER_API_KEY
LAMBDA_API_KEY
```

## Contributing

### Assetify

Mustache templates for code generation are stored in `assets/`. Since Dart packages can't include raw assets, these are encoded using the `assetify.dart` tool.

Whenever you change a mustache template, run:

```sh
just assetify
```

Or, to rebuild the entire workspace:

```sh
just generate
```

### License

This project is licensed under the terms of the [MIT License](../../LICENSE).
