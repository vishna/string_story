import 'package:flutter/material.dart';
import '../utils/safe_area_ext.dart';
import '../tokens/radii.dart';
import '../utils/theme_ext.dart';
import '../tokens/dimensions.dart';

class TopEdgeGradient extends StatelessWidget {
  const TopEdgeGradient({
    super.key,
    required this.child,
    this.colors,
  });

  final Widget child;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    if (colors != null && colors!.isEmpty) {
      return child;
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors ??
            [
              context.colors.surface,
              context.colors.surface.withValues(alpha: 0.0),
            ],
      )),
      child: child,
    );
  }
}

class TopInputBoxContainer extends StatelessWidget {
  const TopInputBoxContainer({
    super.key,
    required this.child,
    this.borderRadius = Radii.borderS,
    this.backgroundColor,
    this.borderColor,
  });

  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: P_SM + EdgeInsets.only(top: context.safeAreaPaddingTop),
      child: Material(
        color: backgroundColor ?? context.colors.surface,
        clipBehavior: Clip.antiAlias,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        ),
        child: child,
      ),
    );
  }
}
