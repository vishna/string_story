import 'package:flutter_test/flutter_test.dart';
import 'package:string_story/src/utils/flags_ext.dart';
import 'package:flag/flag_enum.dart';

void main() {
  group('FlagCodeExtension', () {
    test('returns correct FlagsCode for direct match', () {
      expect('US'.toFlagCode(), FlagsCode.US);
      expect('us'.toFlagCode(), FlagsCode.US);
      expect('FR'.toFlagCode(), FlagsCode.FR);
      expect('fr'.toFlagCode(), FlagsCode.FR);
    });

    test('returns correct FlagsCode for language_country format', () {
      expect('en_US'.toFlagCode(), FlagsCode.US);
      expect('es_ES'.toFlagCode(), FlagsCode.ES);
      expect('es_SV'.toFlagCode(), FlagsCode.SV); // Salvadore
      expect('pt_BR'.toFlagCode(), FlagsCode.BR);
      expect('fr_FR'.toFlagCode(), FlagsCode.FR);
    });

    test('returns correct FlagsCode for language-only format', () {
      expect('en'.toFlagCode(), FlagsCode.GB); // English -> United Kingdom
      expect('pt'.toFlagCode(), FlagsCode.PT); // Portuguese -> Portugal
      expect('de'.toFlagCode(), FlagsCode.DE); // German -> Germany
      expect('fr'.toFlagCode(), FlagsCode.FR); // French -> France
      expect('es'.toFlagCode(), FlagsCode.ES); // Spanish -> Spain
      expect('it'.toFlagCode(), FlagsCode.IT); // Italian -> Italy
      expect('ru'.toFlagCode(), FlagsCode.NULL);
      expect('ja'.toFlagCode(), FlagsCode.JP); // Japanese -> Japan
      expect('zh'.toFlagCode(), FlagsCode.CN); // Chinese -> China
      expect('nl'.toFlagCode(), FlagsCode.NL); // Dutch -> Netherlands
      expect('pl'.toFlagCode(), FlagsCode.PL); // Polish -> Poland
      expect('tr'.toFlagCode(), FlagsCode.TR); // Turkish -> Turkey
      expect('sv'.toFlagCode(), FlagsCode.SE); // Swedish -> Sweden
      expect('fi'.toFlagCode(), FlagsCode.FI); // Finnish -> Finland
      expect('da'.toFlagCode(), FlagsCode.DK); // Danish -> Denmark
      expect('nb'.toFlagCode(), FlagsCode.NO); // Norwegian Bokmål -> Norway
      expect('cs'.toFlagCode(), FlagsCode.CZ); // Czech -> Czech Republic
      expect('hu'.toFlagCode(), FlagsCode.HU); // Hungarian -> Hungary
      expect('el'.toFlagCode(), FlagsCode.GR); // Greek -> Greece
      expect('ko'.toFlagCode(), FlagsCode.KR); // Korean -> South Korea
    });

    test('handles hyphenated codes', () {
      expect('en-US'.toFlagCode(), FlagsCode.US);
      expect('es-ES'.toFlagCode(), FlagsCode.ES);
    });

    test('returns NULL for unknown codes', () {
      expect('foo-bar'.toFlagCode(), FlagsCode.NULL);
    });

    test('returns NULL for malformed codes', () {
      expect(''.toFlagCode(), FlagsCode.NULL);
      expect('_'.toFlagCode(), FlagsCode.NULL);
      expect('en_'.toFlagCode(), FlagsCode.NULL);
      expect('_US'.toFlagCode(), FlagsCode.NULL);
    });
  });
}
