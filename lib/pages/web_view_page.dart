import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/web_view_extra_wrapper.dart';

class WebViewPage extends StatefulWidget {
  final WebViewExtraWrapper extra;

  const WebViewPage({
    Key? key,
    required this.extra,
  }) : super(key: key);

  static Page page({
    LocalKey? key,
    required WebViewExtraWrapper extra,
  }) =>
      MaterialPage<void>(
        key: key,
        child: WebViewPage(
          extra: extra,
        ),
      );

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.extra.title),
      ),
      body: widget.extra.webView,
    );
  }
}
