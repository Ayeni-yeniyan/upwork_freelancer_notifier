import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifyme/app/app.bottomsheets.dart';
import 'package:notifyme/app/app.dialogs.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'init_dependencies.dart' as sl;
import 'ui/theme_manager.dart';

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
    return ScreenUtilInit(
      designSize: const Size(485, 1080),
      enableScaleWH: () => true,
      enableScaleText: () => true,
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (_, child) {
        return ViewModelBuilder.reactive(
          viewModelBuilder: () => ThemeManager(),
          builder: (context, viewModel, child) {
            return MaterialApp(
              initialRoute: Routes.startupView,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: viewModel.lightTheme,
              themeMode: viewModel.themeMode,
              darkTheme: viewModel.darkTheme,
              navigatorObservers: [StackedService.routeObserver],
            );
          },
        );
      },
    );
  }
}
