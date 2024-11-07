import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:notifyme/services/audio_service.dart';
import 'package:notifyme/services/notification_service.dart';
import 'package:notifyme/ui/views/startup/startup_viewmodel.dart';
import 'package:notifyme/ui/views/update/update_viewmodel.dart';

import 'core/repo/firebase_repo.dart';
import 'firebase_options.dart';
import 'services/api_service.dart';
import 'ui/theme_manager.dart';
import 'ui/views/home/home_viewmodel.dart';

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
  // Admob init
  MobileAds.instance.initialize();
  Permission.notification.request();

  // my dependecies
  await NotificationService.initNotification();
  await _initFirebaseMessaging();

  await _initHome();
  await _initUpdate();
}

_initUpdate() async {
  locator.registerFactory<ApiService>(() => FirebaseRepo());
  locator.registerLazySingleton(() => UpdateViewModel(locator()));
}

_initHome() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => prefs);
  ThemeManager.initTheme();
  AudioService.init(prefs);
  StartupViewModel.init(prefs);
  locator.registerLazySingleton(() => HomeViewModel(prefs));
}

_initFirebaseMessaging() async {
  await FirebaseMessaging.instance.requestPermission();
// await FirebaseMessaging.instance.getToken();
}
