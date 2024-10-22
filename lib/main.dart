import 'package:flutter/material.dart';
import 'package:notifyme/app/app.bottomsheets.dart';
import 'package:notifyme/app/app.dialogs.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/app/app.router.dart';
import 'package:notifyme/core/theme/app_pallete.dart';
import 'package:stacked_services/stacked_services.dart';

import 'init_dependencies.dart' as sl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  sl.initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: AppPallete.scafoldBackground,
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
