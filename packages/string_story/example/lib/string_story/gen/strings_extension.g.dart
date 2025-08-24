// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/widgets.dart';
import 'package:string_story_example/i18n/strings.g.dart';
import 'package:synchronized/synchronized.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:collection/collection.dart';

typedef S = Translations;

extension StringsExtension on BuildContext {
  S get strings => Localizations.of<Translations>(this, Translations)!;
}

class SlangDelegate extends LocalizationsDelegate<Translations> {
  SlangDelegate({this.overrideTranslation});

  static final delegate = SlangDelegate();

  final _loadedTranslations = <Locale, Translations>{};
  final _loadLock = Lock();
  var _initializeDateFormattingCalledAtLeastOnce = false;
  final Translations? overrideTranslation;

  @override
  Future<Translations> load(Locale locale) async {
    if (overrideTranslation != null) {
      return overrideTranslation!;
    }

    if (_loadedTranslations[locale] case final Translations value) {
      return value;
    } else {
      return _loadLock.synchronized(() async {
        if (!_initializeDateFormattingCalledAtLeastOnce) {
          await initializeDateFormatting();
          _initializeDateFormattingCalledAtLeastOnce = true;
        }
        if (_loadedTranslations[locale] != null) {
          return _loadedTranslations[locale]!;
        }

        final translations = await locale.asAppLocale().build();
        _loadedTranslations[locale] = translations;
        return translations;
      });
    }
  }

  static Translations loadSync(Locale locale) {
    return delegate._loadedTranslations[locale]!;
  }

  static final List<String> _supportedLanguageCodes =
      AppLocaleUtils.supportedLocales.map((it) => it.languageCode).toList();

  @override
  bool isSupported(Locale locale) =>
      _supportedLanguageCodes.contains(locale.languageCode);

  @override
  bool shouldReload(SlangDelegate old) => old != this;
}

extension AppLocaleExt on Locale {
  AppLocale asAppLocale() {
    final locale = this;
    final appLocale = AppLocale.values.firstWhereOrNull((it) =>
            it.languageCode == locale.languageCode &&
            it.countryCode == locale.countryCode &&
            it.scriptCode == locale.scriptCode) ??
        AppLocale.values.firstWhereOrNull((it) =>
            it.languageCode == locale.languageCode &&
            it.countryCode == locale.countryCode) ??
        AppLocale.values
            .firstWhereOrNull((it) => it.languageCode == locale.languageCode);
    if (appLocale == null) {
      throw StateError("Didn't find AppLocale for Locale($locale)");
    }
    return appLocale;
  }
}
