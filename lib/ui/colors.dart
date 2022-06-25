import 'package:flutter/material.dart';

class AppColor {
  static const primaryColor = Color(0xffd6b738);
  static const MaterialColor primarySwatch = MaterialColor(
    0xffd6b738, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffd6b738), //10%
      100: Color(0xffd6b738), //20%
      200: Color(0xffd6b738), //30%
      300: Color(0xffd6b738), //40%
      400: Color(0xffd6b738), //50%
      500: Color(0xffd6b738), //60%
      600: Color(0xffd6b738), //70%
      700: Color(0xffd6b738), //80%
      800: Color(0xffd6b738), //90%
      900: Color(0xffd6b738), //100%
    },
  );
}
