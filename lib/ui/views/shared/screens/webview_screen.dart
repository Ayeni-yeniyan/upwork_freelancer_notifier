import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewScreen extends StatelessWidget {
  final String webLink;
  const WebviewScreen({super.key, required this.webLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifyME'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(webLink)),
      ),
    );
  }
}
