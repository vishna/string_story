import 'dart:math';

import 'package:flutter/material.dart';

extension SafeAreaExt on BuildContext {
  double get safeAreaPaddingBottom => MediaQuery.paddingOf(this).bottom;
  double get safeAreaPaddingTop => MediaQuery.paddingOf(this).top;

  static const Widget bottom = Builder(builder: _bottomBuilder);
  static const Widget top = Builder(builder: _topBuilder);

  static SizedBox _bottomBuilder(BuildContext context) => SizedBox(
        height: context.safeAreaPaddingBottom,
      );

  static SizedBox _topBuilder(BuildContext context) => SizedBox(
        height: context.safeAreaPaddingTop,
      );
}

class SafeAreaBottom extends StatelessWidget {
  const SafeAreaBottom({
    super.key,
    this.child,
    this.minimumPadding = 0,
  });

  final Widget? child;
  final double minimumPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: max(context.safeAreaPaddingBottom, minimumPadding),
      ),
      child: child,
    );
  }
}

class SafeAreaTop extends StatelessWidget {
  const SafeAreaTop({
    super.key,
    required this.child,
    this.minimumPadding = 0,
  });

  final Widget child;
  final double minimumPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: max(context.safeAreaPaddingTop, minimumPadding),
      ),
      child: child,
    );
  }
}
