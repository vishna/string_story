import 'package:flutter/material.dart';

import 'dimensions.dart';

class Radii {
  Radii._();

  /// used for bookmark item image corners, word chips
  static const borderS = BorderRadius.all(Radius.circular(DimensionsDouble.s));

  /// used for vocabulary items
  static const borderSM = BorderRadius.all(sm);

  static const sm = Radius.circular(DimensionsDouble.sm);

  static const xs = Radius.circular(DimensionsDouble.xs);

  /// used for bookmark item on image progress corners
  static const borderXXS = BorderRadius.all(xxs);

  static const xxs = Radius.circular(DimensionsDouble.xs / 2);
}
