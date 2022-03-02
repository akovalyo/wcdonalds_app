import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<bool> openInBrowser(String url) async {
    try {
      await launch(url);
    } catch (e) {
      return false;
    }

    return true;
  }
}
