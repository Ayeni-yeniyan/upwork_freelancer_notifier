import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:notifyme/core/app_strings.dart';
import 'package:notifyme/core/logger.dart';
import 'package:notifyme/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WebviewWidget extends StatelessWidget {
  const WebviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => locator<HomeViewModel>(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Upwork'),
            ),
            body: InAppWebView(
              // keepAlive: viewModel.keepAlive,
              // key: widget.key,

              initialUrlRequest:
                  URLRequest(url: WebUri(AppStrings.upworkBestMatch)),
              onWebViewCreated: viewModel.setUpworkController,
              // onLoadStart: (controller, url) {
              //   viewModel.setUpworkController(controller);
              //   infoLog(url?.path ?? 'No path detected');
              // },
              onLoadStop: viewModel.onLoadCompleteUpwork,
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
              ),
            ),
          );
        });
  }
}

// https://www.upwork.com/nx/find-work/best-matches
