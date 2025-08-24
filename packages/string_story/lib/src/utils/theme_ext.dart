import 'package:flutter/material.dart';

extension ThemeBuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textStyles => theme.textTheme;
}
