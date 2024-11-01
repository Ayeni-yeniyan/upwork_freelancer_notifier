import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';

class BottomNavViewModel extends BaseViewModel {
  // BannerAd? _bannerAd;
  // BannerAd? get bannerAd {
  //   if (_addLoaded) {
  //     return _bannerAd;
  //   } else {
  //     return null;
  //   }
  // }

  // bool _addLoaded = false;

  // void loadAds() {
  //   _bannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //     listener: BannerAdListener(
  //       onAdLoaded: (ad) {
  //         _addLoaded = true;
  //         notifyListeners();
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         debugPrint('Error is: $error');
  //         _addLoaded = false;
  //         notifyListeners();
  //         ad.dispose();
  //       },
  //     ),
  //     request: const AdRequest(),
  //   )..load();
  // }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  changeIndex(int newIndex) {
    _selectedIndex = newIndex;
    rebuildUi();
  }
}
