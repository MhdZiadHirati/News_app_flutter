import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key? key,required this.url}) : super(key: key);
  final String url;
  final WebViewController webViewController = WebViewController();
  @override
  Widget build(BuildContext context) {
    webViewController.loadRequest(Uri.parse(url),);
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
