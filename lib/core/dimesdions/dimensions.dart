import 'package:flutter/material.dart';

extension Dimensions on BuildContext {
  Size get mediaQuery {
    return MediaQuery.of(this).size;
  }

  double get height => mediaQuery.height;
  double get width => mediaQuery.width;

  double dynamicHeight(double value) {
    return height * value;
  }

  double dynamicWidth(double value) {
    return width * value;
  }
}
