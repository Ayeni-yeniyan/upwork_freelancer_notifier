import 'package:flutter/material.dart';
import 'package:notifyme/core/theme/app_pallete.dart';

class AppDecoration {
  AppDecoration._();
  static BoxDecoration get contactDecor => BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppPallete.gold,
          width: 3,
        ),
      );

  static BoxDecoration get jobTileDecor => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppPallete.jobTileColorDark,
      );
}
