import 'package:flutter/material.dart';
import 'package:notifyme/app/app.bottomsheets.dart';
import 'package:notifyme/app/app.dialogs.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/app/app.router.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'init_dependencies.dart' as sl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await sl.initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.system,
      builder: (
        context,
        regularTheme,
        darkTheme,
        themeMode,
      ) {
        return MaterialApp(
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          navigatorObservers: [StackedService.routeObserver],
        );
      },
      darkTheme: ThemeData(
        scaffoldBackgroundColor: AppPallete.scafoldBackgroundDark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppPallete.bottomNavColorDark,
        ),
        cardColor: AppPallete.jobTileColorDark,
        brightness: Brightness.dark,
        primaryColor: AppPallete.gold,
        fontFamily: 'Poppins',
      ),
      lightTheme: ThemeData(
        scaffoldBackgroundColor: AppPallete.scafoldBackground,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppPallete.white,
        ),
        cardColor: AppPallete.white,
        brightness: Brightness.light,
        primaryColor: AppPallete.gold,
        fontFamily: 'Poppins',
      ),
    );
  }
}
