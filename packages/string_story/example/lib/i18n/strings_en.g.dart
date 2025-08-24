///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations implements BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  Translations(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.en,
              overrides: overrides ?? {},
              cardinalResolver: cardinalResolver,
              ordinalResolver: ordinalResolver,
            ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

  // Translations

  /// en: 'About'
  String get aboutBtn =>
      TranslationOverrides.string(_root.$meta, 'aboutBtn', {}) ?? 'About';

  /// en: 'This is a sample app using String Story.'
  String get aboutText =>
      TranslationOverrides.string(_root.$meta, 'aboutText', {}) ??
      'This is a sample app using String Story.';

  /// en: 'About'
  String get aboutTitle =>
      TranslationOverrides.string(_root.$meta, 'aboutTitle', {}) ?? 'About';

  /// en: 'Change Language'
  String get changeLanguage =>
      TranslationOverrides.string(_root.$meta, 'changeLanguage', {}) ??
      'Change Language';

  /// en: 'Developer Mode'
  String get developerMode =>
      TranslationOverrides.string(_root.$meta, 'developerMode', {}) ??
      'Developer Mode';

  /// en: 'Home'
  String get homeTitle =>
      TranslationOverrides.string(_root.$meta, 'homeTitle', {}) ?? 'Home';

  /// en: 'Locale Editor'
  String get localeEditor =>
      TranslationOverrides.string(_root.$meta, 'localeEditor', {}) ??
      'Locale Editor';

  /// en: 'Settings'
  String get settingsBtn =>
      TranslationOverrides.string(_root.$meta, 'settingsBtn', {}) ?? 'Settings';

  /// en: 'Change your preferences here.'
  String get settingsText =>
      TranslationOverrides.string(_root.$meta, 'settingsText', {}) ??
      'Change your preferences here.';

  /// en: 'Settings'
  String get settingsTitle =>
      TranslationOverrides.string(_root.$meta, 'settingsTitle', {}) ??
      'Settings';

  /// en: 'Translation changes copied to clipboard.'
  String get snackbarMessage =>
      TranslationOverrides.string(_root.$meta, 'snackbarMessage', {}) ??
      'Translation changes copied to clipboard.';

  /// en: 'Sorry'
  String get sorry =>
      TranslationOverrides.string(_root.$meta, 'sorry', {}) ?? 'Sorry';

  /// en: 'String Story Editor'
  String get stringStoryEditor =>
      TranslationOverrides.string(_root.$meta, 'stringStoryEditor', {}) ??
      'String Story Editor';

  /// en: 'Welcome to String Story!'
  String get welcome =>
      TranslationOverrides.string(_root.$meta, 'welcome', {}) ??
      'Welcome to String Story!';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'aboutBtn':
        return TranslationOverrides.string(_root.$meta, 'aboutBtn', {}) ??
            'About';
      case 'aboutText':
        return TranslationOverrides.string(_root.$meta, 'aboutText', {}) ??
            'This is a sample app using String Story.';
      case 'aboutTitle':
        return TranslationOverrides.string(_root.$meta, 'aboutTitle', {}) ??
            'About';
      case 'changeLanguage':
        return TranslationOverrides.string(_root.$meta, 'changeLanguage', {}) ??
            'Change Language';
      case 'developerMode':
        return TranslationOverrides.string(_root.$meta, 'developerMode', {}) ??
            'Developer Mode';
      case 'homeTitle':
        return TranslationOverrides.string(_root.$meta, 'homeTitle', {}) ??
            'Home';
      case 'localeEditor':
        return TranslationOverrides.string(_root.$meta, 'localeEditor', {}) ??
            'Locale Editor';
      case 'settingsBtn':
        return TranslationOverrides.string(_root.$meta, 'settingsBtn', {}) ??
            'Settings';
      case 'settingsText':
        return TranslationOverrides.string(_root.$meta, 'settingsText', {}) ??
            'Change your preferences here.';
      case 'settingsTitle':
        return TranslationOverrides.string(_root.$meta, 'settingsTitle', {}) ??
            'Settings';
      case 'snackbarMessage':
        return TranslationOverrides.string(
                _root.$meta, 'snackbarMessage', {}) ??
            'Translation changes copied to clipboard.';
      case 'sorry':
        return TranslationOverrides.string(_root.$meta, 'sorry', {}) ?? 'Sorry';
      case 'stringStoryEditor':
        return TranslationOverrides.string(
                _root.$meta, 'stringStoryEditor', {}) ??
            'String Story Editor';
      case 'welcome':
        return TranslationOverrides.string(_root.$meta, 'welcome', {}) ??
            'Welcome to String Story!';
      default:
        return null;
    }
  }
}
