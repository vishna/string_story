import 'package:string_story_example/main.dart';
import 'package:string_story_example/string_story/gen/string_story.dart';

StringStory settingsStringStory() => StringStory(
      keys: [
        StringKey.stringStoryEditor,
        StringKey.settingsTitle,
        StringKey.settingsText,
        StringKey.developerMode,
      ],
      title: "Settings",
      builder: (_) => SettingsScreen(),
    );
