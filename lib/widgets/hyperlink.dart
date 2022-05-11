import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wcdonalds_app/models/platform.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

import '../navigation/routes.dart';
import '../models/web_view_extra_wrapper.dart';
import '../models/app_state.dart';
import '../models/url_launcher.dart';

class Hyperlink extends StatelessWidget {
  final String title;
  final String link;
  final Color? color;
  final double fontSize;
  final bool underline;
  final VoidCallback? onTap;
  final MouseCursor? mouseCursor;

  const Hyperlink({
    Key? key,
    required this.title,
    this.link = '/',
    this.color,
    this.fontSize = 18.0,
    this.underline = true,
    this.onTap,
    this.mouseCursor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppState appState = context.read<AppState>();
    return InkWell(
      hoverColor: Colors.transparent,
      mouseCursor: mouseCursor ?? SystemMouseCursors.click,
      onTap: onTap ??
          () {
            if (link.startsWith('http')) {
              if (appState.platform == PlatformInfo.web) {
                UrlLauncher.openInBrowser(link);
              } else {
                context.push(Routes.webView.path,
                    extra: WebViewExtraWrapper(
                        title: title,
                        webView: WebView(
                          initialUrl: link,
                          javascriptMode: JavascriptMode.unrestricted,
                        )));
              }
            } else {
              context.go(link);
            }
          },
      child: Text(
        title,
        style: TextStyle(
          color: color ?? Theme.of(context).colorScheme.primary,
          fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
