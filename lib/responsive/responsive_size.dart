import 'package:flutter/material.dart';

class Responsive {
  /// This method will return the total width of context
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// This method will return the total height of context
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// This method will return `true` when the context size is less than 600
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }
}
