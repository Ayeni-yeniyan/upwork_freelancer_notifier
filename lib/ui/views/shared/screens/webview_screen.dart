import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:notifyme/app/app.dialogs.dart';
import 'package:notifyme/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String webLink;
  const WebviewScreen({super.key, required this.webLink});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  int progressIndicator = 0;
  final controller = WebViewController();
  @override
  void initState() {
    controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            progressIndicator = progress;
            SchedulerBinding.instance.addPostFrameCallback((t) {
              if (mounted) {
                setState(() {});
              }
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.webLink),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifyME'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progressIndicator.toDouble(),
          ),
          Expanded(
            child: WebViewWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
