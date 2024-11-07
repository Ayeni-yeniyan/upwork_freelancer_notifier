import 'package:flutter/material.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class ThemeManager extends BaseViewModel {
  factory ThemeManager() => _instance;
  static final _modeKey = '__isDarkMode';
  static final ThemeManager _instance = ThemeManager._();
  ThemeManager._();
  static initTheme() {
    final isDarkMode = locator<SharedPreferences>().getBool(_modeKey);
    if (isDarkMode != null) {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
  }

  static ThemeMode _themeMode = ThemeMode.system;
  //Set the themedata
  toggleTheme(bool isDarkMode) async {
    await locator<SharedPreferences>().setBool(_modeKey, isDarkMode);
    if (isDarkMode) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    rebuildUi();
  }

  ///Get current themedata
  ThemeMode get themeMode => _themeMode;
  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: AppPallete.scafoldBackground,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppPallete.white,
        ),
        cardColor: AppPallete.white,
        brightness: Brightness.light,
        primaryColor: AppPallete.gold,
        fontFamily: 'Poppins',
      );
  ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: AppPallete.scafoldBackgroundDark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppPallete.bottomNavColorDark,
        ),
        cardColor: AppPallete.jobTileColorDark,
        brightness: Brightness.dark,
        primaryColor: AppPallete.gold,
        fontFamily: 'Poppins',
      );
}
