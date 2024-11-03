import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:notifyme/core/app_strings.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String webLink;
  final bool isLogin;
  const WebviewScreen({
    super.key,
    required this.webLink,
    this.isLogin = false,
  });

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  int progressIndicator = 0;
  final controller = WebViewController();
  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
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
          onUrlChange: (change) {
            if (change.url == AppStrings.upworkRecent && widget.isLogin) {
              Navigator.pop(context);
            }
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
        title: const Text('notifyME'),
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
