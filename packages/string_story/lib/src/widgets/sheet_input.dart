import 'package:flutter/material.dart';
import 'package:string_story/string_story.dart';

class SheetInput extends StatelessWidget {
  const SheetInput({
    super.key,
    this.hintText,
    this.errorText,
    this.onSubmitted,
    this.isSpaceDummy = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textController,
    this.keyboardType,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.padding,
    this.readOnly = false,
  });

  static const dummy = SheetInput(
    isSpaceDummy: true,
  );

  final bool isSpaceDummy;
  final String? hintText;
  final String? errorText;
  final ValueChanged<String>? onSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? textController;
  final TextInputType? keyboardType;
  final bool enableSuggestions;
  final bool autocorrect;
  final EdgeInsets? padding;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final widget = Padding(
      padding: padding ?? P_M,
      child: TextField(
        textInputAction: TextInputAction.go,
        keyboardType: keyboardType,
        controller: textController,
        enableSuggestions: enableSuggestions,
        autocorrect: autocorrect,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(),
          hintText: hintText,
          errorText: errorText,
          suffixIcon: suffixIcon,
        ),
        onSubmitted: (value) {
          if (isSpaceDummy) {
            return;
          }
          onSubmitted?.call(value);
        },
      ),
    );

    if (isSpaceDummy) {
      return IgnorePointer(
        child: Opacity(
          opacity: 0.0,
          child: widget,
        ),
      );
    }

    return widget;
  }
}
