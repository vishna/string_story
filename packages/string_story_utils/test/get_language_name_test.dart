import 'package:test/test.dart';
import 'package:string_story_utils/src/utils.dart';

void main() {
  group('getLanguageName', () {
    test('returns language name for simple code', () {
      expect(getLanguageName('en'), equals('English'));
      expect(getLanguageName('fr'), equals('French'));
      expect(getLanguageName('de'), equals('German'));
    });

    test('returns language name with country code', () {
      expect(getLanguageName('en-US'), equals('English (US)'));
      expect(getLanguageName('fr-FR'), equals('French (FR)'));
      expect(getLanguageName('pt-BR'), equals('Portuguese (BR)'));
    });

    test('handles underscore and space as separator', () {
      expect(getLanguageName('en_US'), equals('English (US)'));
      expect(getLanguageName('fr FR'), equals('French (FR)'));
    });

    test('returns code if language is unknown', () {
      expect(getLanguageName('xx'), equals('xx'));
      expect(getLanguageName('xx-YY'), equals('xx (YY)'));
    });

    test('handles empty string', () {
      expect(getLanguageName(''), equals(''));
    });
  });
}
