# string_story_utils

Developer tools and code generators for the [string_story](../string_story) package.

## Features

- **Doctor**: Validates your app's localization setup.
- **Generate**: Generates code for string management and integration.
- **Align**: Manages string key additions/removals, with optional auto-translation via `dartantic_ai`.
- **Apply Diff**: Applies string JSON exported from the String Story editor back into your project.

## Usage

Run scripts using Dart:

```sh
dart run string_story_utils:doctor
dart run string_story_utils:generate
dart run string_story_utils:align
dart run string_story_utils:apply_diff
```

## Assetify

Mustache templates for code generation are stored in `assets/`. Since Dart packages can't include raw assets, these are encoded using the `assetify.dart` tool.

Whenever you change a mustache template, run:

```sh
just assetify
```

Or, to rebuild the entire workspace:

```sh
just generate
```

## Example: Generating Code

```sh
dart run string_story_utils:generate
```

This will process your string stories and generate the necessary localization code for your app.

## License

This project is licensed under the terms of the [MIT License](../../LICENSE).
