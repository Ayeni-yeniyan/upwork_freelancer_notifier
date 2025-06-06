import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/app_strings.dart';
import 'package:notifyme/core/logger.dart';
import 'package:notifyme/core/models/job.dart';
import 'package:notifyme/core/utils.dart';
import 'package:notifyme/services/audio_service.dart';
import 'package:notifyme/services/job_service.dart';
import 'package:notifyme/app/app.dialogs.dart';
import 'package:notifyme/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeViewModel extends BaseViewModel {
  final _notifSoundString = 'ENABLE_NOTIFICATION_SOUND';
  final _notifString = 'ENABLE_NOTIFICATION';
  final SharedPreferences _sharedPreferences;
  HomeViewModel(this._sharedPreferences) {
    _enableNofif = _sharedPreferences.getBool(_notifString) ?? false;
    _enableSound = _sharedPreferences.getBool(_notifSoundString) ?? true;
    initNotif();
  }
  initNotif() async {
    if (_sharedPreferences.getBool(_notifString) == null) {
      final status = await Permission.notification.status;
      setNotifStat(status.isGranted);
    }
  }

  Future<void> enableBackgroundService() async {
    await NotificationService.service.startService();
  }

  Future<void> disableBackgroundService() async {
    final service = NotificationService.service;
    service.invoke('stopService');
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
  toggleUpworkActive(bool value) async {
    _upworkActive = value;
    if (_upworkActive) {
      onUpworkWebviewInit();
    } else {
      cancelTimer();
    }
    rebuildUi();
  }

  late bool _enableNofif;
  bool get enableNofif => _enableNofif;
  setNotifStat(bool? newStat) async {
    if (newStat != null) {
      final status = await Permission.notification.status;
      if (status.isDenied) {
        final sta = await Permission.notification.request();
        // await _sharedPreferences.setBool(_notifString, sta.isGranted);
        if (sta.isDenied) {
          return;
        }
      }
      await _sharedPreferences.setBool(_notifString, newStat);
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
      return _jobService.jobList
          .where((e) => e.title
              .toLowerCase()
              .trim()
              .contains(searchCtrl.text.toLowerCase().trim()))
          .toList();
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

  Future<void> onUpworkWebviewInit() async {
    enableBackgroundService();
    wcontroller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(_selectedUrl),
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onHttpAuthRequest: (request) {
            toggleUpworkActive(false);
            _dialogService.showCustomDialog(
              variant: DialogType.actionRequired,
            );
            errorLog('Auth requested');
          },
          onPageFinished: (url) async {
            if (url.contains(AppStrings.upworklogin)) {
              if (_timer == null) {
                _dialogService.completeDialog(DialogResponse());
              }
              setCurrentIndex = 0;
              toggleUpworkActive(false);
              _dialogService.showCustomDialog(
                variant: DialogType.signInUpwork,
              );
              errorLog('url is login');
              return;
            }
            if (url == _selectedUrl) {
              await wcontroller.scrollBy(0, 150);
              await Future.delayed(const Duration(seconds: 3));
              await wcontroller.runJavaScript(
                  "(function(){Flutter.postMessage(window.document.body.innerHTML)})();");
              await Future.delayed(const Duration(seconds: 2));
              if (_timer == null) {
                displayLog('Completing scrap');
                _dialogService.completeDialog(DialogResponse());
                setCurrentIndex = 0;
                _activateTimer();
              }
              displayLog('url correct');
            } else {
              if (_timer == null) {
                _dialogService.completeDialog(DialogResponse());
              }
              setCurrentIndex = 0;
              toggleUpworkActive(false);
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
                  id: element.notifId,
                  title: element.title,
                  payload: element.jobLink,
                  body:
                      '${element.paymentStat}, Job budget/Time: ${element.budget}, '
                      'Payment type: ${element.jobType}, Job level: ${element.contractorTier}, '
                      'Proposals: ${element.proposals}, Posted: ${FormartUtils.formatDate(element.dateTime!)}',
                );
              }
              NotificationService.showSummaryNotification(
                  jobLength: newJobsList.length);
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
  void cancelTimer() async {
    _timer?.cancel();
    disableBackgroundService();
  }

  void _activateTimer() {
    _timer = Timer.periodic(_duration, (timer) {
      wcontroller.loadRequest(Uri.parse(_selectedUrl));
    });
  }

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

  void stateSetter() {
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
