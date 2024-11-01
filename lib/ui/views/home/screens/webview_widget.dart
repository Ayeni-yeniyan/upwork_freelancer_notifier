import 'package:flutter/material.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewWidget extends StatelessWidget {
  const WebviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      disposeViewModel: false,
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Upwork Service'),
          ),
          body: WebViewWidget(controller: viewModel.wcontroller),
        );
      },
    );
  }
}
