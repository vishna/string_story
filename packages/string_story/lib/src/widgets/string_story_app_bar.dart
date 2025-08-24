import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:string_story/string_story.dart';

import 'adaptive_layout.dart';
import 'app_bar_linear_progress_indicator.dart';
import 'measurable_widget.dart';

class StringStoryAppBar extends HookWidget implements PreferredSizeWidget {
  const StringStoryAppBar({
    super.key,
    this.title,
    this.progress,
    this.leading = const StringStoryAppBarLeading(),
    this.trailing,
    this.progressWidget,
  });

  final String? title;
  final double? progress;
  final Widget? leading;
  final Widget? trailing;
  final Widget? progressWidget;

  @override
  Widget build(BuildContext context) {
    final trailingWidgetWidth = useState(0.0);
    final leadingWidgetWidth = useState(0.0);

    return LimitedLayoutPadded(
      minPadding: 0,
      builder: (context, sidePadding, _) {
        final centerPadding =
            max(trailingWidgetWidth.value, leadingWidgetWidth.value) +
                DimensionsDouble.m;
        return Padding(
          padding: sidePadding + PH_SM,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: preferredSize.height,
                  width: preferredSize.width,
                  child: Stack(
                    children: [
                      if (leading != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: MeasurableWidget(
                            child: leading!,
                            onChange: (size) {
                              leadingWidgetWidth.value = size.width;
                            },
                          ),
                        ),
                      if (progress != null)
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: centerPadding,
                          right: centerPadding,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppBarLinearProgressIndicator(value: progress!),
                            ],
                          ),
                        ),
                      if (progressWidget != null)
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: centerPadding,
                          right: centerPadding,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              progressWidget!,
                            ],
                          ),
                        ),
                      if (title != null)
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: centerPadding,
                          right: centerPadding,
                          child: Column(
                            mainAxisAlignment:
                                (progress != null || progressWidget != null)
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.center,
                            children: [
                              Text(
                                title!,
                                style: context.textStyles.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      if (trailing != null)
                        Align(
                          alignment: Alignment.centerRight,
                          child: MeasurableWidget(
                            onChange: (size) =>
                                trailingWidgetWidth.value = size.width,
                            child: trailing!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(DimensionsDouble.xxl);
}

class StringStoryAppBarLeading extends StatelessWidget {
  const StringStoryAppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.chevron_left),
    );
  }
}
