import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/app_strings.dart';
import 'package:notifyme/core/logger.dart';
import 'package:notifyme/core/models/job.dart';
import 'package:notifyme/core/utils.dart';
import 'package:notifyme/services/audio_service.dart';
import 'package:notifyme/services/job_service.dart';
// import 'package:notifyme/app/app.bottomsheets.dart';
import 'package:notifyme/app/app.dialogs.dart';
import 'package:notifyme/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:notifyme/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _notifSoundString = 'ENABLE_NOTIFICATION_SOUND';
  final _notifString = 'ENABLE_NOTIFICATION';
  final SharedPreferences _sharedPreferences;
  HomeViewModel(this._sharedPreferences) {
    _enableNofif = _sharedPreferences.getBool(_notifString) ?? true;
    _enableSound = _sharedPreferences.getBool(_notifSoundString) ?? true;
  }

  // bool _addLoaded = false;
  // NativeAd? _nativeAd;
  // NativeAd? get nativeAds {
  //   if (_addLoaded) {
  //     return _nativeAd;
  //   } else {
  //     return null;
  //   }
  // }

  // void loadAds() {
  //   _nativeAd = NativeAd(
  //     adUnitId: 'ca-app-pub-3940256099942544/2247696110',
  //     listener: NativeAdListener(
  //       onAdLoaded: (ad) {
  //         _addLoaded = true;
  //         debugPrint('Add is loaded: $_addLoaded');
  //         notifyListeners();
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         debugPrint('Error is: $error');
  //         _addLoaded = false;
  //         notifyListeners();
  //         debugPrint('Add is loaded: $_addLoaded');
  //         ad.dispose();
  //       },
  //     ),
  //     request: const AdRequest(),
  //     nativeTemplateStyle: NativeTemplateStyle(
  //       templateType: TemplateType.medium,
  //       cornerRadius: 10.0,
  //     ),
  //   )..load();
  // }

  bool _upworkActive = false;
  bool get upworkActive => _upworkActive;
  toggleUpworkActive() {
    _upworkActive = !_upworkActive;
    if (!_upworkActive) {
      cancelTimer();
    } else {
      onUpworkWebviewInit();
    }
    rebuildUi();
  }

  late bool _enableNofif;
  bool get enableNofif => _enableNofif;
  setNotifStat(bool? newStat) {
    if (newStat != null) {
      _sharedPreferences.setBool(_notifString, newStat);
      _enableNofif = newStat;
      rebuildUi();
    }
  }

  late bool _enableSound;
  bool get enableSound => _enableSound;
  setSoundStat(bool? newStat) {
    if (newStat != null) {
      _sharedPreferences.setBool(_notifSoundString, newStat);
      _enableSound = newStat;
      rebuildUi();
    }
  }

  final searchCtrl = TextEditingController();
  final _dialogService = locator<DialogService>();
  // final _navigator = locator<NavigationService>();
  final _jobService = locator<JobService>();
  // InAppWebViewController? _upWorkcontroller;
  final wcontroller = WebViewController();
  List<Job> get jobsList {
    // TODO: Fix filter logic
    // List<Job> filterJoblist = [];
    // if (_entryLevel) {
    //   filterJoblist.addAll(_jobService.jobList.where((e) =>
    //       e.contractorTier.trim().toLowerCase() ==
    //       'Entry level'.trim().toLowerCase()));
    // }
    // if (_intermediateLevel) {
    //   filterJoblist.addAll(_jobService.jobList.where((e) =>
    //       e.contractorTier.trim().toLowerCase() ==
    //       'Intermediate'.trim().toLowerCase()));
    // }
    // if (_expertLevel) {
    //   filterJoblist.addAll(_jobService.jobList.where((e) =>
    //       e.contractorTier.trim().toLowerCase() ==
    //       'Expert'.trim().toLowerCase()));
    // }
    // if (_isPaymentVerified) {
    //   filterJoblist.addAll(_jobService.jobList.where((e) =>
    //       e.paymentStat.trim().toLowerCase() ==
    //       'Payment verified'.trim().toLowerCase()));
    // }
    // if (_fixedPrice) {
    //   filterJoblist.addAll(_jobService.jobList.where((e) =>
    //       e.jobType.trim().toLowerCase() ==
    //       'Fixed-price'.trim().toLowerCase()));
    // }
    // if (_hourly) {
    //   filterJoblist.addAll(_jobService.jobList.where((e) =>
    //       e.jobType.trim().toLowerCase() == 'Hourly'.trim().toLowerCase()));
    // }
    if (searchCtrl.text.isNotEmpty) {
      _jobService.jobList.where((e) => e.title
          .toLowerCase()
          .trim()
          .contains(searchCtrl.text.toLowerCase().trim()));
    }

    return _jobService.jobList;
  }

  Duration _duration = const Duration(seconds: 60);
  changeDuration(Duration newDuration) {
    _duration = newDuration;
  }

  String _selectedUrl = AppStrings.upworkBestMatch;
  String get selectedUrl => _selectedUrl;
  changeSelectedUrl(String? newUrl) {
    if (newUrl != null) {
      _selectedUrl = newUrl;
    }
  }

  bool _fixedPrice = true;
  bool get fixedPrice => _fixedPrice;
  setFixedPrice(bool? newStat) {
    if (newStat != null) {
      _fixedPrice = newStat;
      rebuildUi();
    }
  }

  bool _hourly = true;
  bool get hourly => _hourly;
  setHourly(bool? newStat) {
    if (newStat != null) {
      _hourly = newStat;
      rebuildUi();
    }
  }

  bool _isPaymentVerified = true;
  bool get isPaymentVerified => _isPaymentVerified;
  setPaymentVerified(bool? newStat) {
    if (newStat != null) {
      _isPaymentVerified = newStat;
      rebuildUi();
    }
  }

  bool _entryLevel = true;
  bool get entryLevel => _entryLevel;
  setEntryLevel(bool? newStat) {
    if (newStat != null) {
      _entryLevel = newStat;
      rebuildUi();
    }
  }

  bool _intermediateLevel = true;
  bool get intermediateLevel => _intermediateLevel;
  setIntermediate(bool? newStat) {
    if (newStat != null) {
      _intermediateLevel = newStat;
      rebuildUi();
    }
  }

  bool _expertLevel = true;
  bool get expertLevel => _expertLevel;
  setExpert(bool? newStat) {
    if (newStat != null) {
      _expertLevel = newStat;
      rebuildUi();
    }
  }

  // get getUpworkController => _upWorkcontroller;
  // void setUpworkController(InAppWebViewController controller) async {
  //   if (_timer == null) {
  //     setCurrentIndex = 1;
  //     // await Future.delayed(const Duration(seconds: 1), () {
  //     //   _dialogService.showCustomDialog(
  //     //     variant: DialogType.loading,
  //     //   );
  //     // });
  //   }
  //   displayLog(await controller.getHtml() ?? 'Html string empty');
  //   displayLog('setting controller');
  //   _upWorkcontroller = controller;
  //   if (_upWorkcontroller == null) {
  //     errorLog('setting controller failed');
  //   } else {
  //     infoLog('setting controller Successful');
  //   }
  // }

  void onUpworkWebviewInit() async {
    wcontroller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(_selectedUrl),
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onHttpAuthRequest: (request) {
            toggleUpworkActive();
            _dialogService.showCustomDialog(
              variant: DialogType.actionRequired,
            );
            errorLog('Auth requested');
          },
          onPageFinished: (url) async {
            if (url == _selectedUrl) {
              await wcontroller.scrollBy(0, 150);
              await Future.delayed(const Duration(seconds: 3), () {});
              await wcontroller.runJavaScript(
                  "(function(){Flutter.postMessage(window.document.body.innerHTML)})();");
              await Future.delayed(const Duration(seconds: 2), () {});
              if (_timer == null) {
                displayLog('Completing scrap');
                _activateTimer();
                _dialogService.completeDialog(DialogResponse());
                setCurrentIndex = 0;
              }
              displayLog('url correct');
            } else {
              toggleUpworkActive();
              _dialogService.showCustomDialog(
                variant: DialogType.actionRequired,
              );
              errorLog('url is not correct');
            }
          },
          onHttpError: (error) {},
          onWebResourceError: (error) {},
        ),
      )
      ..addJavaScriptChannel(
        'Flutter',
        onMessageReceived: (message) async {
          displayLog(message.message);
          final newJobsList = await _jobService.newJobsGotten(message.message);
          if (newJobsList.isNotEmpty) {
            // _jobsList.addAll(newJobsAvailable);
            rebuildUi();
            if (_timer != null && _enableNofif) {
              for (var element in newJobsList) {
                NotificationService.showNotification(
                  id: element.id,
                  title: element.title,
                  body:
                      '${element.paymentStat}, Job budget/Time: ${element.budget}, '
                      'Payment type: ${element.jobType}, Job level: ${element.contractorTier}, '
                      'Proposals: ${element.proposals}, Posted: ${FormartUtils.formatDate(element.dateTime!)}',
                );
              }
            }
            if (_timer != null && _enableSound) {
              AudioService.playNotifSound();
            }
          }
        },
      );
    if (_timer == null) {
      setCurrentIndex = 1;
      await Future.delayed(const Duration(seconds: 1), () {
        _dialogService.showCustomDialog(
          variant: DialogType.loading,
        );
      });
    }
  }

  Timer? _timer;
  void cancelTimer() {
    _timer?.cancel();
  }

  void _activateTimer() {
    _timer = Timer.periodic(_duration, (timer) {
      wcontroller.loadRequest(Uri.parse(_selectedUrl));
    });
  }

  // void onLoadCompleteUpwork(
  //     InAppWebViewController controller, WebUri? uri) async {
  //   final scroll = await controller.getContentHeight() ?? 100;
  //   //  (await controller.getScrollY()) ?? 0 + 100;
  //   // await controller.scrollBy(x: 0, y: scroll, animated: true);
  //   await controller.scrollTo(x: 0, y: scroll ~/ 20, animated: true);
  //   await Future.delayed(const Duration(seconds: 3));
  //   final htmlText = await controller.getHtml();
  //   displayLog(uri?.rawValue.toString());
  //   // _upWorkcontroller = controller;
  //   if (uri!.rawValue == _selectedUrl) {
  //     final newJobsList = await _jobService.newJobsGotten(htmlText ?? '');
  //     if (newJobsList.isNotEmpty) {
  //       // _jobsList.addAll(newJobsAvailable);
  //       rebuildUi();
  //       if (_timer != null && _enableNofif) {
  //         for (var element in newJobsList) {
  //           NotificationService.showNotification(
  //             id: element.id,
  //             title: element.title,
  //             body: 'This is the notif body',
  //             payload: 'What is a payload',
  //           );
  //         }
  //       }
  //       if (_enableSound) {
  //         AudioService.playNotifSound();
  //       }
  //     } else {
  //       displayLog('No Job updates.');
  //     }
  //     displayLog('url correct');
  //   } else {
  //     _dialogService.showCustomDialog(
  //       variant: DialogType.actionRequired,
  //     );
  //     errorLog('url is not correct');
  //   }
  //   if (_timer == null) {
  //     _activateTimer();
  //     _dialogService.completeDialog(DialogResponse());
  //     displayLog('current $_index');
  //     setCurrentIndex = 0;
  //     displayLog('new $_index');
  //   }
  // }

  int _index = 0;
  int get index => _index;
  set setCurrentIndex(int newIndex) {
    infoLog('change index has been called to $newIndex');
    _index = newIndex;
    rebuildUi();
  }

  void onChanged(String? value) {
    rebuildUi();
  }

  // InAppWebViewController? _freelancercontroller;
  // final upworkWebview = InAppWebView();
  // final freelancerWebview = InAppWebView();

  // void changeIndex() {
  //   NotificationService.showNotification(
  //       id: 1, title: 'title', body: 'body', payload: 'payload');
  //   if (_index == 1) {
  //     setCurrentIndex = 0;
  //     return;
  //   }
  //   setCurrentIndex = 1;
  // }

  // void reloadUrl() {
  //   _upWorkcontroller?.loadUrl(
  //     urlRequest: URLRequest(
  //       url: WebUri(_selectedUrl),
  //     ),
  //   );
  //   if (_upWorkcontroller == null) {
  //     errorLog('_upWorkcontroller is not available');
  //   } else {
  //     infoLog(
  //         '_upWorkcontroller is available and the reload fuction has been called');
  //   }
  // }

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
