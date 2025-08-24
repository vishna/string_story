import 'package:flutter/material.dart';
import 'package:string_story/string_story.dart';
import 'package:string_story_example/main.dart';
import 'package:string_story_example/string_story/gen/string_story.dart';
import 'package:provider/provider.dart';

StringStory homeStringStory() => StringStory(
      keys: [
        StringKey.welcome,
        StringKey.homeTitle,
        StringKey.changeLanguage,
        StringKey.aboutBtn,
        StringKey.settingsBtn,
        StringKey.localeEditor,
        StringKey.snackbarMessage,
      ],
      title: "Home Page",
      builder: (context) {
        // inspect which key is selected in the editor
        final selectedKey = context.read<StringStorySelection>().key;
        final navigatorKey = GlobalKey<NavigatorState>();

        // apply special action if necessary
        if (selectedKey == StringKey.snackbarMessage) {
          navigatorKey.executeWithContext((context) {
            MySnacks.showTranslationChangesCopied(context: context);
          });
        }

        return StringStoryApp(
          navigatorKey: navigatorKey,
          builder: (_) => HomeScreen(),
        );
      },
    );

// you can write stories for single widgets too
StringStory errorWidget() => StringStory(
      keys: [StringKey.sorry],
      title: "My Error Widget",
      builder: (_) => Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyErrorWidget(reason: StackTrace.current),
      )),
    );

StringStory justShowSnackbar() => StringStory(
      keys: [StringKey.snackbarMessage],
      title: "Just Show Snackbar",
      builder: (_) => StringStoryAutoOpen(onOpen: (context) {
        MySnacks.showTranslationChangesCopied(context: context);
      }),
    );
