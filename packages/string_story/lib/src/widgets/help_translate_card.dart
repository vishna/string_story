import 'package:flutter/material.dart';

import 'package:simple_rich_text/simple_rich_text.dart';
import 'package:string_story/src/tokens/dimensions.dart';
import 'package:string_story/src/utils/theme_ext.dart';

class HelpTranslateCard extends StatelessWidget {
  const HelpTranslateCard({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: context.colors.tertiaryContainer,
      child: Padding(
        padding: P_M,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.translate,
              size: DimensionsDouble.ml,
              color: context.colors.onTertiaryContainer,
            ),
            SH_SM,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SimpleRichText(
                    title,
                    style: context.textStyles.titleSmall
                        ?.copyWith(color: context.colors.onTertiaryContainer),
                  ),
                  SimpleRichText(
                    message,
                    style: context.textStyles.bodySmall
                        ?.copyWith(color: context.colors.onTertiaryContainer),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
