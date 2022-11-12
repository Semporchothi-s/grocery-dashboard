import 'package:flutter/material.dart';
import 'package:grocery_dashboard/themes/colors/colors.dart';

class TxtStyle {
  static TextStyle primary({bool isWhite = false}) {
    return TextStyle(
      color: isWhite ? TxtColor.white : TxtColor.black,
      fontFamily: "quicksand",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bold({bool isWhite = false}) {
    return TextStyle(
      color: isWhite ? TxtColor.white : TxtColor.black,
      // fontFamily: "quicksand",
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle logo({bool isWhite = false}) {
    return TextStyle(
      color: isWhite ? TxtColor.white : TxtColor.black,
      fontFamily: "quicksand",
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle menu({bool isWhite = false}) {
    return TextStyle(
        color: isWhite ? TxtColor.white : TxtColor.white.withOpacity(0.5),
        fontFamily: "nunito",
        fontWeight: FontWeight.w700,
        letterSpacing: 1);
  }

  // static TextStyle menu({bool isWhite = false}) {
  //   return TextStyle(
  //       color: TxtColor.black,
  //       fontFamily: "quicksand",
  //       fontWeight: FontWeight.w900,
  //       letterSpacing: 1.1);
  // }
}
