import 'package:flutter/material.dart';
import 'package:notifyme/core/theme/app_pallete.dart';

class AppDecoration {
  AppDecoration._();
  static BoxDecoration get skillDecor =>
      BoxDecoration(borderRadius: BorderRadius.circular(10));
  static BoxDecoration get jobTileDecor => BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: AppPallete.grey));
}
