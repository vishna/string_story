# string_story

A Flutter package for building in-app locale editor and translation storyboards, powered by the [slang](https://pub.dev/packages/slang) package.

## Features

- **In-app Locale Editor**: Edit translations directly within your app, either in context ("in situ") or via a story board editor.
- **Story-based Coverage**: Write "string stories" to ensure all translatable strings are covered and visible to translators in real app contexts.
- **Developer Tools**: Integrates with [`string_story_utils`](../string_story_utils) for code generation and string management.

## Getting Started

1. **Add Dependencies**

   In your app's `pubspec.yaml`:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     slang: ^3.0.0 # prequisite to using string_story
     string_story: # latest version

   dev_dependencies:
     string_story_utils: # latest version
   ```

2. **Configure Slang**

   Create a `slang.yaml` in your project root (see the example in [`example/slang.yaml`](./example/slang.yaml)).

3. **Write String Stories**

   Create story files in `lib/string_story/stories/`. For example:

   ```dart
   StringStory helloWorld() => StringStory(
      keys: [
        StringKey.hello,
        StringKey.world,
      ],
      title: "Hello World Screen",
      builder: (_) => HelloWorld(),
   );
   ```

4. **Validate Setup**

   Use the doctor script from `string_story_utils`:

   ```sh
   dart run string_story_utils:doctor
   ```

5. **Generate Code**

   Please run this from you app folder to generate all necessary project files

   ```sh
   dart run string_story_utils:generate
   ```

   Later on, when adding new strings you might only need to run

   ```sh
   dart run string_story_utils:generate --stories-only
   ```

## Why String Stories?

By writing "string stories," you ensure that every translation key is exercised in a real UI context. This helps translators see strings as they appear in the app, improving translation quality and coverage.

## See Also

- [string_story_utils](../string_story_utils): Developer tools for code generation and string management.
- [Example App](./example): A working Flutter app demonstrating String Story in action.
