// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_story_example/string_story/gen/string_story.dart';
import 'package:string_story/string_story.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class LocaleEditorSheet {
  LocaleEditorSheet._();

  static Future<void> show(BuildContext context) async {
    final keysToDisplay = TranslationScopeKeys.of(context)?.value;
    if (keysToDisplay == null) {
      return;
    }

    WoltModalSheet.show(
        context: context,
        pageListBuilder: (_) => [_sheet()],
        modalDecorator: (child) {
          return BlocProvider(
            create: (context) {
              return SlangEditorCubit(
                baseCubit: context.read<SlangBaseCubit>(),
                scopedKeys: keysToDisplay,
                ovLocale: StringStoryService.instance.config.appLanguageCode,
              );
            },
            child: child,
          );
        });
  }

  static NonScrollingWoltModalSheetPage _sheet() {
    return NonScrollingWoltModalSheetPage(
      child: Padding(
        padding: const EdgeInsets.only(top: DimensionsDouble.m),
        child: LocaleEditorWidget(
          showScopedValues: true,
          isSearchAvailable: false,
          onJsonPathSelected: (_) {},
        ),
      ),
    );
  }
}
