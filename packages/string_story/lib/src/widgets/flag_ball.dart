import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

class FlagBall extends StatelessWidget {
  const FlagBall({
    super.key,
    required this.flagCode,
    required this.size,
  });

  //final LanguageDataDesc language;
  final double size;
  final FlagsCode flagCode;

  @override
  Widget build(BuildContext context) {
    return FlagBallCircle(
      size: size,
      child: Flag.fromCode(
        flagCode,
        flagSize: FlagSize.size_1x1,
      ),
    );
  }
}

class FlagBallCircle extends StatelessWidget {
  const FlagBallCircle({
    super.key,
    required this.child,
    required this.size,
  });

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: SizedBox(width: size, height: size, child: child),
    );
  }
}
