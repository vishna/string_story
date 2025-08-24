import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:string_story/src/utils/safe_area_ext.dart';
import 'package:string_story/src/widgets/string_story_internal_strings.dart';
import 'package:string_story/string_story.dart';

import 'top_input_box_container.dart';

class FloatingSearchBar extends HookWidget {
  const FloatingSearchBar({
    super.key,
    required this.initialValue,
    required this.onInputUpdate,
    this.suffixIcon,
    this.fadeColors,
  });

  final String initialValue;
  final ValueChanged<String> onInputUpdate;

  final Widget? suffixIcon;

  final List<Color>? fadeColors;

  static preferredHeight(BuildContext context) =>
      72.0 + context.safeAreaPaddingTop;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: initialValue);

    void onSearchUpdate() {
      onInputUpdate(textController.text);
    }

    useEffect(() {
      textController.addListener(onSearchUpdate);
      return () {
        textController.removeListener(onSearchUpdate);
      };
    });

    return TopEdgeGradient(
      colors: fadeColors,
      child: TopInputBoxContainer(
        child: TextField(
          textInputAction: TextInputAction.go,
          controller: textController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_outlined),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide.none,
              ),
              hintText: packageStrings.search,
              suffixIcon: suffixIcon),
          onSubmitted: (value) {
            onSearchUpdate();
          },
        ),
      ),
    );
  }
}
