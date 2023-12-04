import 'package:flutter/material.dart';
import 'package:news_app/modules/webView_module/webView_screen.dart';
export 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(initialUrl: url),
    );
  }
}
