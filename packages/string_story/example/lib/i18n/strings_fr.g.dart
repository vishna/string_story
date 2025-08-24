///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang/overrides.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFr implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsFr(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.fr,
              overrides: overrides ?? {},
              cardinalResolver: cardinalResolver,
              ordinalResolver: ordinalResolver,
            ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <fr>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final TranslationsFr _root = this; // ignore: unused_field

  @override
  TranslationsFr $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsFr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get aboutBtn =>
      TranslationOverrides.string(_root.$meta, 'aboutBtn', {}) ?? 'À propos';
  @override
  String get aboutText =>
      TranslationOverrides.string(_root.$meta, 'aboutText', {}) ??
      'Ceci est une application exemple utilisant String Story.';
  @override
  String get aboutTitle =>
      TranslationOverrides.string(_root.$meta, 'aboutTitle', {}) ?? 'À propos';
  @override
  String get changeLanguage =>
      TranslationOverrides.string(_root.$meta, 'changeLanguage', {}) ??
      'Changer de langue';
  @override
  String get developerMode =>
      TranslationOverrides.string(_root.$meta, 'developerMode', {}) ??
      'Mode développeur';
  @override
  String get homeTitle =>
      TranslationOverrides.string(_root.$meta, 'homeTitle', {}) ?? 'Accueil';
  @override
  String get localeEditor =>
      TranslationOverrides.string(_root.$meta, 'localeEditor', {}) ??
      'Éditeur de Localisation';
  @override
  String get settingsBtn =>
      TranslationOverrides.string(_root.$meta, 'settingsBtn', {}) ??
      'Paramètres';
  @override
  String get settingsText =>
      TranslationOverrides.string(_root.$meta, 'settingsText', {}) ??
      'Modifiez vos préférences ici.';
  @override
  String get settingsTitle =>
      TranslationOverrides.string(_root.$meta, 'settingsTitle', {}) ??
      'Paramètres';
  @override
  String get snackbarMessage =>
      TranslationOverrides.string(_root.$meta, 'snackbarMessage', {}) ??
      'Modifications de la traduction copiées dans le presse-papiers.';
  @override
  String get sorry =>
      TranslationOverrides.string(_root.$meta, 'sorry', {}) ?? 'Désolé';
  @override
  String get stringStoryEditor =>
      TranslationOverrides.string(_root.$meta, 'stringStoryEditor', {}) ??
      'Éditeur d\'Histoire de Chaîne';
  @override
  String get welcome =>
      TranslationOverrides.string(_root.$meta, 'welcome', {}) ??
      'Bienvenue dans String Story!';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'aboutBtn':
        return TranslationOverrides.string(_root.$meta, 'aboutBtn', {}) ??
            'À propos';
      case 'aboutText':
        return TranslationOverrides.string(_root.$meta, 'aboutText', {}) ??
            'Ceci est une application exemple utilisant String Story.';
      case 'aboutTitle':
        return TranslationOverrides.string(_root.$meta, 'aboutTitle', {}) ??
            'À propos';
      case 'changeLanguage':
        return TranslationOverrides.string(_root.$meta, 'changeLanguage', {}) ??
            'Changer de langue';
      case 'developerMode':
        return TranslationOverrides.string(_root.$meta, 'developerMode', {}) ??
            'Mode développeur';
      case 'homeTitle':
        return TranslationOverrides.string(_root.$meta, 'homeTitle', {}) ??
            'Accueil';
      case 'localeEditor':
        return TranslationOverrides.string(_root.$meta, 'localeEditor', {}) ??
            'Éditeur de Localisation';
      case 'settingsBtn':
        return TranslationOverrides.string(_root.$meta, 'settingsBtn', {}) ??
            'Paramètres';
      case 'settingsText':
        return TranslationOverrides.string(_root.$meta, 'settingsText', {}) ??
            'Modifiez vos préférences ici.';
      case 'settingsTitle':
        return TranslationOverrides.string(_root.$meta, 'settingsTitle', {}) ??
            'Paramètres';
      case 'snackbarMessage':
        return TranslationOverrides.string(
                _root.$meta, 'snackbarMessage', {}) ??
            'Modifications de la traduction copiées dans le presse-papiers.';
      case 'sorry':
        return TranslationOverrides.string(_root.$meta, 'sorry', {}) ??
            'Désolé';
      case 'stringStoryEditor':
        return TranslationOverrides.string(
                _root.$meta, 'stringStoryEditor', {}) ??
            'Éditeur d\'Histoire de Chaîne';
      case 'welcome':
        return TranslationOverrides.string(_root.$meta, 'welcome', {}) ??
            'Bienvenue dans String Story!';
      default:
        return null;
    }
  }
}
