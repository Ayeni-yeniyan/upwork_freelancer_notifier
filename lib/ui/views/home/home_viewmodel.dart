import 'dart:async';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/app_strings.dart';
import 'package:notifyme/core/logger.dart';
import 'package:notifyme/core/models/job.dart';
import 'package:notifyme/services/job_service.dart';
// import 'package:notifyme/app/app.bottomsheets.dart';
import 'package:notifyme/app/app.dialogs.dart';
// import 'package:notifyme/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  bool _hasInitWebControllerView = false;
  final _dialogService = locator<DialogService>();
  // final _navigator = locator<NavigationService>();
  final _jobService = locator<JobService>();
  InAppWebViewController? _upWorkcontroller;
  List<Job> get jobsList => _jobService.jobList;

  Duration _duration = const Duration(seconds: 60);
  get getUpworkController => _upWorkcontroller;
  void setUpworkController(InAppWebViewController controller) async {
    displayLog('_hasInitWebControllerView $_hasInitWebControllerView');
    displayLog('_hasInitWebControllerView $_hasInitWebControllerView');
    displayLog('_hasInitWebControllerView $_hasInitWebControllerView');
    if (!_hasInitWebControllerView) {
      setCurrentIndex = 1;
      await Future.delayed(const Duration(seconds: 1), () {
        _dialogService.showCustomDialog(
          variant: DialogType.loading,
        );
      });
    }
    displayLog(await controller.getHtml() ?? 'Html string empty');
    displayLog('setting controller');
    _upWorkcontroller = controller;
    if (_upWorkcontroller == null) {
      errorLog('setting controller failed');
    } else {
      infoLog('setting controller Successful');
    }
  }

  Timer? _timer;
  void cancelTimer() {
    _timer?.cancel();
  }

  void _activateTimer() {
    _timer = Timer.periodic(_duration, (timer) {
      _upWorkcontroller?.reload();
    });
  }

  void onLoadCompleteUpwork(
      InAppWebViewController controller, WebUri? uri) async {
    if (_timer == null) {
      _activateTimer();
    }
    final scroll = await controller.getContentHeight() ?? 100;
    //  (await controller.getScrollY()) ?? 0 + 100;
    // await controller.scrollBy(x: 0, y: scroll, animated: true);
    await controller.scrollTo(x: 0, y: scroll ~/ 20, animated: true);
    await Future.delayed(const Duration(seconds: 3));
    final htmlText = await controller.getHtml();
    displayLog(uri?.rawValue.toString());
    // _upWorkcontroller = controller;
    if (uri!.rawValue == AppStrings.upworkBestMatch) {
      final newJobsAvailable = await _jobService.newJobsGotten(htmlText ?? '');
      if (newJobsAvailable) {
        // _jobsList.addAll(newJobsAvailable);
        rebuildUi();
        // locator<NotificationService>().showNotification(
        //     id: 1, title: 'title', body: 'body', payload: 'payload');
      } else {
        displayLog('No Job updates.');
      }
      displayLog('url correct');
    } else {
      errorLog('url is not correct');
    }
    if (!_hasInitWebControllerView) {
      _dialogService.completeDialog(DialogResponse());
      displayLog('current $_index');
      setCurrentIndex = 0;
      displayLog('new $_index');
      _hasInitWebControllerView = true;
    }
  }

  int _index = 0;
  int get index => _index;
  set setCurrentIndex(int newIndex) {
    infoLog('change index has been called to $newIndex');
    _index = newIndex;
    rebuildUi();
  }

  // InAppWebViewController? _freelancercontroller;
  // final upworkWebview = InAppWebView();
  // final freelancerWebview = InAppWebView();

  void changeIndex() {
    if (_index == 1) {
      setCurrentIndex = 0;
      return;
    }
    setCurrentIndex = 1;
  }

  void reloadUrl() {
    _upWorkcontroller?.reload();
    if (_upWorkcontroller == null) {
      errorLog('_upWorkcontroller is not available');
    } else {
      infoLog(
          '_upWorkcontroller is available and the reload fuction has been called');
    }
  }

  // void showDialog() {
  //   _dialogService.showCustomDialog(
  //     variant: DialogType.infoAlert,
  //     title: 'Stacked Rocks!',
  //     description: 'Give stacked $_counter stars on Github',
  //   );
  // }

  // void showBottomSheet() {
  //   _bottomSheetService.showCustomSheet(
  //     variant: BottomSheetType.notice,
  //     title: ksHomeBottomSheetTitle,
  //     description: ksHomeBottomSheetDescription,
  //   );
  // }
}
