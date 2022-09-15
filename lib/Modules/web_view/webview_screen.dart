import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webviewscreen extends StatelessWidget {
  final String url;
  webviewscreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
