import 'package:firebase_core/firebase_core.dart';
import 'package:notifyme/core/repo/firebase_repo.dart';
import 'package:notifyme/ui/views/update/update_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';

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
  // my dependecies
  locator.registerLazySingleton(() => HomeViewModel());
  NotificationService.initNotification();
  _initUpdate();
}

_initUpdate() {
  // locator.registerFactory<ApiService>(() => FirebaseRepo());
  locator.registerLazySingleton(() => UpdateViewModel(locator()));
}
