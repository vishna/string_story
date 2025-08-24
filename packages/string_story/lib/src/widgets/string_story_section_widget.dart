import 'package:flutter/material.dart';
import 'package:string_story/string_story.dart';

class StringStorySectionWidget extends StatelessWidget {
  const StringStorySectionWidget(
    this.text, {
    super.key,
    this.icon,
    this.iconWidget,
    this.padding,
    this.color,
    this.capitalize = true,
  });

  final String text;
  final IconData? icon;
  final Widget? iconWidget;
  final EdgeInsets? padding;
  final Color? color;
  final bool capitalize;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.colors.onSurface.withValues(alpha: 0.7);
    return Padding(
      padding: padding ??
          PH_M +
              const EdgeInsets.only(
                top: DimensionsDouble.m,
                bottom: DimensionsDouble.s,
              ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: DimensionsDouble.sm,
              color: color,
            ),
            SH_S
          ],
          if (iconWidget != null) ...[
            SizedBox(
              width: DimensionsDouble.sm,
              height: DimensionsDouble.sm,
              child: iconWidget,
            ),
            SH_S
          ],
          Text(
            capitalize ? text.toUpperCase() : text,
            style: context.textStyles.bodySmall!.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
