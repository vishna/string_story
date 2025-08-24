import 'package:flutter/widgets.dart';
import 'package:simple_rich_text/simple_rich_text.dart';
import 'package:string_story/string_story.dart';

enum StringStoryEmptyStateStyle { normal, mini }

class StringStoryEmptyState extends StatelessWidget {
  const StringStoryEmptyState({
    super.key,
    required this.icon,
    required this.description,
    this.mainAxisSize = MainAxisSize.max,
    this.style = StringStoryEmptyStateStyle.normal,
  });

  final Widget icon;
  final String description;
  final MainAxisSize mainAxisSize;
  final StringStoryEmptyStateStyle style;

  @override
  Widget build(BuildContext context) {
    final color = context.colors.onSurface.withValues(alpha: 0.4);

    if (style == StringStoryEmptyStateStyle.mini) {
      return Padding(
        padding: PH_L,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconTheme(
              data: IconThemeData(color: color, size: DimensionsDouble.l),
              child: icon,
            ),
            SH_ML,
            Expanded(
              child: SimpleRichText(
                description,
                textAlign: TextAlign.left,
                style: context.textStyles.bodyMedium?.copyWith(color: color),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: PH_XL,
      child: Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconTheme(
              data: IconThemeData(color: color, size: DimensionsDouble.xxl),
              child: icon),
          SV_ML,
          SimpleRichText(
            description,
            textAlign: TextAlign.center,
            style: context.textStyles.bodyLarge?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
