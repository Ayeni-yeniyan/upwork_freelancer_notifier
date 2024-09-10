import 'package:flutter/material.dart';
import 'package:notifyme/core/theme/app_pallete.dart';

class AppTextstyle {
  AppTextstyle._();

  static TextStyle get skillTextStyle => const TextStyle();
  static TextStyle get labelTextStyle =>
      const TextStyle(fontSize: 40, fontWeight: FontWeight.w900);
  static TextStyle get labelTextStyleSmall =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static TextStyle get bodyTextStyle =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  static TextStyle get buttonTextStyle =>
      TextStyle(color: AppPallete.white, fontSize: 18);
  static TextStyle get bodyTextStyleMedium => const TextStyle(fontSize: 16);
}
