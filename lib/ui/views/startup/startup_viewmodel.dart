import 'package:flutter/material.dart';
import 'package:notifyme/app/app.dialogs.dart';
import 'package:notifyme/core/repo/firebase_repo.dart';
import 'package:notifyme/services/api_service.dart';
import 'package:notifyme/ui/views/startup/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  static late SharedPreferences _sharedPreferences;
  final _dialogService = locator<DialogService>();
  static init(SharedPreferences prefs) {
    _sharedPreferences = prefs;
  }

  final ApiService _repo = FirebaseRepo();
  final _navigator = locator<NavigationService>();
  final _isFirstOpen = 'ISFIRSTOPEN';

  Future<void> runStartupLogic() async {
    final res = await _repo.signInAnonymously();

    res.fold(
      (l) {
        _navigator.replaceWithUpdateView();
      },
      (right) async {
        final updateRes = await _repo.getUpdate();
        updateRes.fold(
          (l) {},
          (r) {
            if (r) {
              final isFirstOpen = _sharedPreferences.getBool(_isFirstOpen);
              if (isFirstOpen == null) {
                StackedService.navigatorKey?.currentState
                    ?.pushReplacement(MaterialPageRoute(
                  builder: (context) => const OnboardingScreen(),
                ));
              } else {
                _navigator.replaceWithBottomNavView();
              }
            } else {
              _navigator.replaceWithUpdateView();
            }
          },
        );
      },
    );
  }

  navOnFirstOpen() async {
    await _sharedPreferences.setBool(_isFirstOpen, false);
    _navigator.replaceWithBottomNavView();
    await Future.delayed(const Duration(seconds: 1));
    _dialogService.showCustomDialog(
      variant: DialogType.signInUpwork,
    );
  }
}
