// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:string_story_example/i18n/strings.g.dart';
import 'package:string_story_example/string_story/gen/string_story.dart';
import 'package:string_story/string_story.dart'
    show SlangBaseState, SlangBaseStateIdle, SlangBaseStateData;

extension SlangBaseStateExt on SlangBaseState {
  SlangDelegate asSlangDelegate() {
    final state = this;

    return switch (state) {
      SlangBaseStateIdle() => SlangDelegate.delegate,
      SlangBaseStateData() => SlangDelegate(
          overrideTranslation: AppLocaleUtils.buildWithOverridesFromMapSync(
            locale: _fromLanguageCode(state.languageCode),
            isFlatMap: false,
            map: state.slangJson,
          ),
        ),
    };
  }
}

AppLocale _fromLanguageCode(String code) =>
    AppLocale.values.firstWhere((it) => it.languageCode == code);
