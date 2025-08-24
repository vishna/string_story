import 'package:flutter/material.dart';

class IgnoreFocus extends StatelessWidget {
  const IgnoreFocus({
    super.key,
    required this.child,
    this.ignoring = true,
  });

  final Widget child;
  final bool ignoring;

  @override
  Widget build(BuildContext context) {
    if (!ignoring) {
      return child;
    }

    return Focus(
      canRequestFocus: false,
      descendantsAreFocusable: false,
      descendantsAreTraversable: false,
      child: child,
    );
  }
}
