import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:notifyme/services/audio_service.dart';
import 'package:notifyme/ui/views/startup/startup_viewmodel.dart';
import 'package:notifyme/ui/views/update/update_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'core/repo/firebase_repo.dart';
import 'firebase_options.dart';
import 'services/api_service.dart';
import 'ui/views/home/home_viewmodel.dart';
import 'package:notifyme/services/notification_service.dart';

final locator = StackedLocator.instance;

Future<void> initDependencies() async {
  // Init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await ThemeManager.initialise();
  // Admob init
  MobileAds.instance.initialize();

  // my dependecies
  NotificationService.initNotification();
  _initHome();
  _initUpdate();
}

_initUpdate() {
  locator.registerFactory<ApiService>(() => FirebaseRepo());
  locator.registerLazySingleton(() => UpdateViewModel(locator()));
}

_initHome() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  AudioService.init(prefs);
  StartupViewModel.init(prefs);
  locator.registerLazySingleton(() => HomeViewModel(prefs));
}
