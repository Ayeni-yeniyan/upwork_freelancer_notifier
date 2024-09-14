import 'package:stacked/stacked_annotations.dart';

import 'ui/views/home/home_viewmodel.dart';

final locator = StackedLocator.instance;

Future<void> initDependencies() async {
  // my dependecies
  locator.registerLazySingleton(() => HomeViewModel());
}
