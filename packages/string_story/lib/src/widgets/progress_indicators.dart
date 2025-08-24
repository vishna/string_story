import 'package:flutter/material.dart';
import 'package:string_story/string_story.dart';

class ProgressIndicators {
  ProgressIndicators._();

  static const mini = SizedBox(
    width: DimensionsDouble.m,
    height: DimensionsDouble.m,
    child: CircularProgressIndicator(
      strokeWidth: DimensionsDouble.xs / 2,
    ),
  );
}
