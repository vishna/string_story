// Cant't use _kLinearProgressIndicatorHeight 'cause it is private in the
// progress_indicator.dart file
import 'package:flutter/material.dart';
import 'package:string_story/string_story.dart';

const double _kAppBarLinearProgressIndicatorHeight = DimensionsDouble.s;

class AppBarLinearProgressIndicator extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarLinearProgressIndicator({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Size get preferredSize =>
      const Size(double.infinity, _kAppBarLinearProgressIndicatorHeight);

  @override
  Widget build(BuildContext context) {
    final progressColorActive = context.colors.primaryContainer;
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.maxWidth;
      return Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: progressColorActive,
                border: Border.all(style: BorderStyle.none),
                borderRadius: const BorderRadius.all(
                  Radius.circular(_kAppBarLinearProgressIndicatorHeight / 2),
                ),
              ),
              height: preferredSize.height,
              width: value * size,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ],
      );
    });
  }
}
