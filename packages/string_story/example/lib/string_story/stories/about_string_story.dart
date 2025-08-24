import 'package:string_story_example/main.dart';
import 'package:string_story_example/string_story/gen/string_story.dart';

StringStory aboutStringStory() => StringStory(
      keys: [
        StringKey.aboutTitle,
        StringKey.aboutText,
      ],
      title: "About",
      builder: (_) => AboutScreen(),
    );
