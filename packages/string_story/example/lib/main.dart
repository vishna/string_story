import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:string_story/string_story.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_story_example/i18n/strings.g.dart';
import 'package:string_story_example/string_story/gen/string_story.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:equatable/equatable.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

void main() {
  final appConfig = AppConfig();

  StringStoryService.setLazySingleton(
    () => StringStoryService(
      // store locale changes somehow
      getJsonById: (String id) async {
        final jsonString = appConfig.memoryStorage[id];
        if (jsonString == null) {
          return null;
        }

        return jsonDecode(jsonString);
      },
      putJsonById: ({
        required String id,
        required dynamic dataJson,
      }) async {
        appConfig.memoryStorage[id] = jsonEncode(dataJson);
      },

      // communicate with the rest of the app
      stringStoryConfig: appConfig.stringStoryConfig,

      // generated utilities
      generatedDelegate: StringStoryGeneratedDelegateImpl(),

      // in-app editor section
      inAppEditorConfig: InAppEditorConfig(
        buildErrorWidget: (it) => MyErrorWidget(
          reason: it,
        ),
        getUserContactData: () => appConfig.userContactData,
        setUserContactData: (data) {
          appConfig.userContactData = data;
        },
        submitTranslations: (data, version) async {
          await Clipboard.setData(ClipboardData(text: jsonEncode(data)));
          MySnacks.showTranslationChangesCopied(
              context: _navigatorKey.currentContext!);
        },
        developerLogPaneBuilder: (context) => _LoggingWidget(
          logsSince: DateTime.now(),
        ),
      ),

      // hook up to internal logging
      log: (level, message) {
        print("[${level.name}] $message");
        _LoggingWidget.addLog(_LogItem(
          message: message,
          level: level,
          time: DateTime.now(),
        ));
      },
    ),
  );

  runApp(
    BlocProvider(
      create: (_) => SlangBaseCubit(),
      child: MyApp(appConfig: appConfig),
    ),
  );
}

class AppConfig {
  final memoryStorage = <String, String>{};
  UserContactData? userContactData;

  final stringStoryConfig = ValueNotifier(
    StringStoryConfig(
      appLanguageCode: "en",
      isEnabled: false,
      isDeveloper: false,
    ),
  );

  Future<void> setAppLanguageCode(String appLanguageCode) async {
    // IMPORTANT Slang translations are lazy loaded, so just make sure we load
    // them with await before instrumenting a switch
    await SlangDelegate.delegate.load(Locale(appLanguageCode));
    stringStoryConfig.value =
        stringStoryConfig.value.copyWith(appLanguageCode: appLanguageCode);
  }

  void setStringEditorEnabled(bool value) {
    stringStoryConfig.value =
        stringStoryConfig.value.copyWith(isEnabled: value);
  }

  void setDeveloperModeEnabled(bool value) {
    stringStoryConfig.value =
        stringStoryConfig.value.copyWith(isDeveloper: value);
  }

  void switchToNextLocale() {
    final currentLocale = stringStoryConfig.value.appLanguageCode;
    final availableLocales =
        AppLocaleUtils.supportedLocales.map((it) => it.languageCode).toList();
    final currentLocaleIndex = availableLocales.indexOf(currentLocale);
    final nextLocale =
        availableLocales[(currentLocaleIndex + 1) % availableLocales.length];
    setAppLanguageCode(nextLocale);
  }
}

class MyApp extends HookWidget {
  const MyApp({
    super.key,
    required this.appConfig,
  });

  final AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    final slangBaseState = context.watch<SlangBaseCubit>().state;

    final appLanguageCode = useListenableSelector(appConfig.stringStoryConfig,
        () => appConfig.stringStoryConfig.value.appLanguageCode);

    return Provider.value(
      value: appConfig,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TranslationScope(
          child: HomeScreen(),
        ),
        routes: {
          '/about': (_) => const TranslationScope(child: AboutScreen()),
          '/settings': (_) => const TranslationScope(child: SettingsScreen()),
          '/editor': (_) => const StringStoryScreen(),
        },
        locale: Locale(appLanguageCode),
        localizationsDelegates: [
          slangBaseState.asSlangDelegate(),
          // you need these 3 otherwise complains
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocaleUtils.supportedLocales,
      ),
    );
  }
}

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    final appConfig = context.read<AppConfig>();
    final (isEditingEnabled, appLanguageCode) = useListenableSelector(
        appConfig.stringStoryConfig,
        () => (
              appConfig.stringStoryConfig.value.isEnabled,
              appConfig.stringStoryConfig.value.appLanguageCode
            ));

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.homeTitle),
        leading: IconButton(
          tooltip: context.strings.changeLanguage,
          onPressed: context.read<AppConfig>().switchToNextLocale,
          icon: FlagBall(flagCode: appLanguageCode.toFlagCode(), size: 20.0),
        ),
        actions: [QuickEditButton()],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(strings.welcome),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: Text(strings.aboutBtn),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              child: Text(strings.settingsBtn),
            ),
            const SizedBox(height: 24),
            if (isEditingEnabled) ...[
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/editor'),
                child: Text(strings.localeEditor),
              ),
              const SizedBox(height: 24),
            ]
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.aboutTitle),
        actions: [QuickEditButton()],
      ),
      body: Center(child: Text(context.strings.aboutText)),
    );
  }
}

class SettingsScreen extends HookWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfig = context.read<AppConfig>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.settingsTitle),
        actions: [QuickEditButton()],
      ),
      body: Center(
        child: Column(
          children: [
            Text(context.strings.settingsText),
            SwitchListTile.adaptive(
                title: Text(context.strings.stringStoryEditor),
                value: useListenableSelector(appConfig.stringStoryConfig,
                    () => appConfig.stringStoryConfig.value.isEnabled),
                onChanged: appConfig.setStringEditorEnabled),
            SwitchListTile.adaptive(
                title: Text(context.strings.developerMode),
                value: useListenableSelector(appConfig.stringStoryConfig,
                    () => appConfig.stringStoryConfig.value.isDeveloper),
                onChanged: appConfig.setDeveloperModeEnabled),
          ],
        ),
      ),
    );
  }
}

class _LogItem extends Equatable {
  final dynamic message;
  final StringStoryServiceLogLevel level;
  final DateTime time;

  _LogItem({
    required this.message,
    required this.level,
    required this.time,
  });

  @override
  List<Object?> get props => [message, level, time];
}

class _LoggingWidget extends HookWidget {
  const _LoggingWidget({this.logsSince});

  final DateTime? logsSince;

  static final logs = ValueNotifier(<_LogItem>[]);

  static void addLog(_LogItem item) {
    logs.value = List.from(logs.value)..add(item);
  }

  @override
  Widget build(BuildContext context) {
    var items = useListenable(logs).value;

    final logsSince = this.logsSince;
    if (logsSince != null) {
      items = items.where((it) => it.time.isAfter(logsSince)).toList();
    }

    return ListView.builder(
      reverse: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[items.length - 1 - index];
        return Card(
          surfaceTintColor: switch (item.level) {
            StringStoryServiceLogLevel.debug => Colors.black87,
            StringStoryServiceLogLevel.info => Colors.greenAccent,
            StringStoryServiceLogLevel.warn => Colors.amberAccent,
            StringStoryServiceLogLevel.error => Colors.redAccent,
          },
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(item.message.toString().trim()),
          ),
        );
      },
    );
  }
}

class MySnacks {
  MySnacks._();

  static void showTranslationChangesCopied({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(context.strings.snackbarMessage),
      duration: Duration(seconds: 20),
      behavior: SnackBarBehavior.floating,
    ));
  }
}

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key, this.reason});

  final dynamic reason;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(context.strings.sorry),
        Text(
          reason.toString(),
          maxLines: 10,
          style: context.textStyles.labelSmall,
        )
      ],
    );
  }
}

class QuickEditButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appConfig = context.read<AppConfig>();
    final isEditingEnabled = useListenableSelector(appConfig.stringStoryConfig,
        () => appConfig.stringStoryConfig.value.isEnabled);

    if (isEditingEnabled) {
      return IconButton(
        onPressed: () {
          LocaleEditorSheet.show(context);
        },
        icon: Icon(Icons.translate),
      );
    }

    return SizedBox.shrink();
  }
}
