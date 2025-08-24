import 'package:flag/flag_enum.dart';

extension FlagCodeExtension on String {
  /// Converts a language code (e.g., 'en', 'en_US', 'es', 'es_ES') to a FlagsCode enum.
  ///
  /// The method first tries to find a direct match for the full code.
  /// If that fails, it checks if the code is in the format 'language_country'
  /// and attempts to match the country code part. If a match is found,
  /// the corresponding [FlagsCode] enum is returned. If no match is found,
  /// it returns [FlagsCode.NULL].
  FlagsCode toFlagCode() {
    final code = replaceAll("-", "_").toLowerCase();
    final parts = code.split("_");
    String langCode;
    String? countryCode;

    // check for malformed code
    if (parts.length == 2 &&
        (parts.first.trim().isEmpty || parts.last.trim().isEmpty)) {
      return FlagsCode.NULL;
    }

    if (parts.length > 2) {
      return FlagsCode.NULL;
    }

    // we assume this is only language code
    if (parts.length == 1) {
      langCode = parts.first;
    } else {
      langCode = parts.first;
      countryCode = parts.last;
    }

    if (langCode == "ru" || langCode == "ru") {
      // Boycott terrorist state.
      return FlagsCode.NULL;
    }

    if (countryCode == null) {
      return _languageCodeToFlagCode(langCode);
    }

    // check for a direct match of the full code
    try {
      return FlagsCode.values.byName(countryCode.toUpperCase());
    } catch (e) {
      // Direct match not found, continue to the next step
    }

    // 4. Fallback to NULL if no match is found
    return FlagsCode.NULL;
  }
}

FlagsCode _languageCodeToFlagCode(String languageCode) {
  // in most cases direct match will work
  try {
    return _languageCodeToCountryCode[languageCode] ??
        FlagsCode.values.byName(languageCode.toUpperCase());
  } catch (e) {
    return FlagsCode.NULL;
  }
}

// Fallback mapping from ISO 639-1 language codes to ISO 3166-1 country codes.
// Use this only when a country code is not available.
// This map is intentionally limited to cases where the 2-letter language code
// does not directly match a country code (e.g. 'cs' -> 'CZ').
// For languages with a matching country code (e.g. 'pl' -> 'PL', 'de' -> 'DE'),
// no entry is needed here.
// When a language is spoken in multiple countries, a single "default" country
// is chosen as a representative (e.g. 'ar' -> 'SA', 'en' -> 'GB').
Map<String, FlagsCode> _languageCodeToCountryCode = {
  'af': FlagsCode.ZA, // Afrikaans -> South Africa
  'am': FlagsCode.ET, // Amharic -> Ethiopia
  'ar': FlagsCode.SA, // Arabic -> Saudi Arabia
  'bn': FlagsCode.BD, // Bengali -> Bangladesh
  'bs': FlagsCode.BA, // Bosnian -> Bosnia and Herzegovina
  'ca': FlagsCode.ES, // Catalan -> Spain
  'cs': FlagsCode.CZ, // Czech -> Czechia
  'cy': FlagsCode.GB_WLS, // Welsh -> United Kingdom (Wales)
  'da': FlagsCode.DK, // Danish -> Denmark
  'el': FlagsCode.GR, // Greek -> Greece
  'en': FlagsCode.GB, // English -> United Kingdom (default)
  'et': FlagsCode.EE, // Estonian -> Estonia
  'eu': FlagsCode.ES, // Basque -> Spain
  'fa': FlagsCode.IR, // Persian -> Iran
  'ga': FlagsCode.IE, // Irish -> Ireland
  'gn': FlagsCode.PY, // Guaraní -> Paraguay
  'he': FlagsCode.IL, // Hebrew -> Israel
  'hi': FlagsCode.IN, // Hindi -> India
  'id': FlagsCode.ID, // Indonesian -> Indonesia
  'ii': FlagsCode.CN, // Sichuan Yi -> China
  'ja': FlagsCode.JP, // Japanese -> Japan
  'km': FlagsCode.KH, // Khmer -> Cambodia
  'ko': FlagsCode.KR, // Korean -> South Korea
  'lo': FlagsCode.LA, // Lao -> Laos
  'ms': FlagsCode.MY, // Malay -> Malaysia
  'my': FlagsCode.MM, // Burmese -> Myanmar
  'nb': FlagsCode.NO, // Norwegian Bokmål -> Norway
  'ne': FlagsCode.NP, // Nepali -> Nepal
  'pa': FlagsCode.IN, // Punjabi -> India (could also be Pakistan)
  'si': FlagsCode.LK, // Sinhala -> Sri Lanka
  'sl': FlagsCode.SI, // Slovenian -> Slovenia
  'sq': FlagsCode.AL, // Albanian -> Albania
  'sr': FlagsCode.RS, // Serbian -> Serbia
  'sv': FlagsCode.SE, // Swedish -> Sweden
  'sw': FlagsCode.TZ, // Swahili -> Tanzania
  'ta': FlagsCode.LK, // Tamil -> Sri Lanka (could also be India)
  'tg': FlagsCode.TJ, // Tajik -> Tajikistan
  'ti': FlagsCode.ER, // Tigrinya -> Eritrea (also Ethiopia)
  'uk': FlagsCode.UA, // Ukrainian -> Ukraine
  'ur': FlagsCode.PK, // Urdu -> Pakistan
  'vi': FlagsCode.VN, // Vietnamese -> Vietnam
  'yi': FlagsCode.IL, // Yiddish -> Israel
  'yo': FlagsCode.NG, // Yoruba -> Nigeria
  'zh': FlagsCode.CN, // Chinese -> China
};
