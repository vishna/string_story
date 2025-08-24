import 'package:flutter/material.dart';

class ClipRRectWithBorder extends StatelessWidget {
  const ClipRRectWithBorder({
    super.key,
    this.borderWidth = 0.5,
    this.borderRadius = 4.0,
    required this.child,
    required this.color,
  });

  final double borderWidth;
  final double borderRadius;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.all(Radius.circular(borderRadius));
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: radius,
              child: ColoredBox(color: color)),
        ),
        Positioned(
          top: borderWidth,
          right: borderWidth,
          bottom: borderWidth,
          left: borderWidth,
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: radius,
            child: SizedBox.expand(child: child),
          ),
        ),
      ],
    );
  }
}
