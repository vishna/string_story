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
     slang: ^4.8.0 # prequisite to using string_story
     string_story: # latest version

   dev_dependencies:
     string_story_utils: # latest version
   ```

2. **Configure Slang**

   Create a `slang.yaml` in your project root (see the example in [`example/slang.yaml`](./example/slang.yaml)).

   - make sure you have the locale file in place
   - run `dart run slang` to verify your slang setup is correct

3. **Configure String Story**

   Check string_story section inside `slang.yaml`

   Use the doctor script from `string_story_utils`:

   ```sh
   dart run string_story_utils:doctor
   ```

   - make sure you include json translation directory as assets of your app

   ```yaml
   flutter:
     assets:
       - lib/i18n/json/ # example location
   ```

   Run the following command to generate bunch of files (UI editor):

   ```sh
   dart run string_story_utils:doctor
   ```

   If the command fails, follow the prompt messages or run doctor script again

   The linter might show you a couple of errors/warning. Easy fix is:

   ```yaml
   include: package:flutter_lints/flutter.yaml

   analyzer:
     - "**/*.g.dart"
   ```

   Make sure you pass these to Material (...or Cupertino) App:

   ```dart
   locale: Locale(appLanguageCode),
   localizationsDelegates: [
     slangBaseState.asSlangDelegate(),
     // you need these 3 otherwise Flutter complains
     GlobalMaterialLocalizations.delegate,
     GlobalWidgetsLocalizations.delegate,
     GlobalCupertinoLocalizations.delegate,
   ],
   ```

4. **Write String Stories**

Create story files in your defined directory location, e.g.: `lib/string_story/stories/`. For example:

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

Generate binding code with:

```sh
dart run string_story_utils:generate --stories-only
```

You might tho first regenerate slang dart files with:

```sh
dart run slang
```

5. In App Integration

![](https://github.com/vishna/string_story/blob/main/img/architecture.png?raw=true)

- Put SlangBaseCubit above your app
- Establish binding between your app and the SlangBaseCubit
- Make sure you screen(s) are wrapped in a TranslationScope

Check `example` folder for implementation reference.

## Why String Stories?

By writing "string stories," you ensure that every translation key is exercised in a real UI context. This helps translators see strings as they appear in the app, improving translation quality and coverage.

## See Also

- [string_story_utils](../string_story_utils): Developer tools for code generation and string management.
- [Example App](./example): A working Flutter app demonstrating String Story in action.
