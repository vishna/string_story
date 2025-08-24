import 'package:flutter/material.dart';
import 'package:simple_rich_text/simple_rich_text.dart';
import 'package:string_story/string_story.dart';

import 'progress_indicators.dart';

class SheetInputHint extends StatelessWidget {
  const SheetInputHint({
    required this.text,
    super.key,
    this.topPadding = true,
    this.showSpinner = false,
  });

  final String text;

  /// set to false when adding buttons to top bar
  final bool topPadding;

  /// set to true, to show indefinite spinner above text
  final bool showSpinner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: topPadding
          ? P_ML + const EdgeInsets.only(top: DimensionsDouble.l)
          : P_ML,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showSpinner) ...[
            ProgressIndicators.mini,
            SV_M,
          ],
          SimpleRichText(
            text,
            textAlign: TextAlign.center,
            style: context.textStyles.labelMedium,
          ),
        ],
      ),
    );
  }
}
