import 'dart:math';

import 'package:flutter/material.dart';
import '../tokens/breakpoints.dart';
import '../tokens/dimensions.dart';

class StringStoryAdaptiveLayout extends StatelessWidget {
  const StringStoryAdaptiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Breakpoints.small) {
          return mobile(context);
        } else {
          if (tablet != null && constraints.maxWidth < Breakpoints.medium) {
            return tablet!(context);
          }
          return desktop(context);
        }
      },
    );
  }
}

class LimitedLayout extends StatelessWidget {
  const LimitedLayout({
    super.key,
    required this.child,
    this.minPadding = DimensionsDouble.m,
    this.breakpoint = Breakpoints.medium,
  });

  final Widget child;
  final double minPadding;
  final double breakpoint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > breakpoint) {
        final organicPadding = (constraints.maxWidth - breakpoint) / 2;
        var extraPadding = 0.0;
        if (organicPadding < minPadding) {
          extraPadding = (minPadding - organicPadding).abs();
        }
        return Center(
          child: SizedBox(
            width: breakpoint,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: extraPadding),
              child: child,
            ),
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: minPadding),
          child: child,
        );
      }
    });
  }
}

class LimitedLayoutPadded extends StatelessWidget {
  const LimitedLayoutPadded({
    super.key,
    required this.builder,
    this.minPadding = DimensionsDouble.m,
    this.breakpoint = Breakpoints.medium,
  });

  final Widget Function(
          BuildContext context, EdgeInsets padding, BoxConstraints constraints)
      builder;
  final double minPadding;
  final double breakpoint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > breakpoint) {
        final availableSpace = (constraints.maxWidth - breakpoint) / 2;
        return builder(
            context,
            EdgeInsets.symmetric(horizontal: max(minPadding, availableSpace)),
            constraints);
      } else {
        return builder(
            context, EdgeInsets.symmetric(horizontal: minPadding), constraints);
      }
    });
  }
}

extension SliverPaddingExt on List<Widget> {
  List<Widget> withPadding(EdgeInsets padding) => map(
        (it) => SliverPadding(
          padding: padding,
          sliver: it,
        ),
      ).toList();
}

class StringStoryGoldenPanes extends StatelessWidget {
  final Widget smallerPane;
  final Widget biggerPane;
  final bool flipped;
  final bool showDivider;

  const StringStoryGoldenPanes({
    super.key,
    required this.flipped,
    required this.smallerPane,
    required this.biggerPane,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!flipped)
          Expanded(
            flex: 1000,
            child: smallerPane,
          ),
        if (!flipped && showDivider)
          const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          flex: 1618,
          child: biggerPane,
        ),
        if (flipped && showDivider)
          const VerticalDivider(thickness: 1, width: 1),
        if (flipped)
          Expanded(
            flex: 1000,
            child: smallerPane,
          ),
      ],
    );
  }
}
