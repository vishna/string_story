import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:string_story/src/widgets/cliprrect_with_border.dart';
import 'package:string_story/src/utils/theme_ext.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget.language({
    super.key,
    required this.height,
    required String this.languageCode,
    this.onTap,
  }) : iconData = null;

  const FlagWidget.icon({
    super.key,
    required this.height,
    required IconData this.iconData,
    this.onTap,
  }) : languageCode = null;

  final String? languageCode;
  final IconData? iconData;
  final double height;
  final VoidCallback? onTap;

  static _width(double height) => height * (4.0 / 3.0);

  @override
  Widget build(BuildContext context) {
    final lc = languageCode?.toUpperCase();
    Widget flagWidget;

    if (lc != null) {
      flagWidget = Flag.fromCode(
        FlagsCode.values.firstWhere((element) => element.name == lc),
      );
    } else {
      flagWidget = Icon(
        iconData!,
        size: height * 0.75,
      );

      if (onTap == null) {
        flagWidget = ColoredBox(
          color: context.colors.surface,
          child: flagWidget,
        );
      }
    }

    if (onTap != null) {
      flagWidget = Material(
        child: InkWell(
          onTap: onTap,
          child: flagWidget,
        ),
      );
    }

    return SizedBox(
      height: height,
      width: _width(height),
      child: ClipRRectWithBorder(
        borderWidth: 0.5,
        borderRadius: 4.0,
        color: context.colors.onSurface,
        child: flagWidget,
      ),
    );
  }
}
