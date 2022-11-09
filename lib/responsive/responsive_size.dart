import 'package:flutter/material.dart';

class Responsive {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }
}
