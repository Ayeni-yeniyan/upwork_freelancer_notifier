import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:notifyme/core/logger.dart';
// import 'package:notifyme/app/app.bottomsheets.dart';
// import 'package:notifyme/app/app.dialogs.dart';
// import 'package:notifyme/app/app.locator.dart';
// import 'package:notifyme/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  // final _dialogService = locator<DialogService>();
  // final _bottomSheetService = locator<BottomSheetService>();
  // final keepAlive = InAppWebViewKeepAlive();
  InAppWebViewController? _upWorkcontroller;
  // final _upworkNotifcontroller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (progress) {
  //         // Update loading bar.
  //       },
  //       onPageStarted: (url) {},
  //       onPageFinished: (url) {},
  //       onHttpError: (error) {},
  //       onWebResourceError: (error) {},
  //       onNavigationRequest: (request) {
  //         if (request.url.startsWith('https://www.youtube.com/')) {
  //           return NavigationDecision.prevent;
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   )
  //   ..loadRequest(Uri.parse('https://flutter.dev'));
  // WebViewController get upworkNotifcontroller => _upworkNotifcontroller;
  // PullToRefreshController? _pullToRefreshController;

  get getUpworkController => _upWorkcontroller;
  void setUpworkController(InAppWebViewController controller) async {
    displayLog(await controller.getHtml() ?? 'Html string empty');
    displayLog('setting controller');
    _upWorkcontroller = controller;
    if (_upWorkcontroller == null) {
      errorLog('setting controller failed');
    } else {
      infoLog('setting controller Successful');
    }
  }

  int _index = 0;
  int get index => _index;
  set setCurrentIndex(int newIndex) {
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

  Future<void> scrapperService() async {}
}
