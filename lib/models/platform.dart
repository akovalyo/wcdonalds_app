import 'package:flutter/foundation.dart';

class Platform {
  static String android = 'android';
  static String fuchsia = 'fuchsia';
  static String ios = 'ios';
  static String linux = 'linux';
  static String macOs = 'macOs';
  static String windows = 'windows';
  static String web = 'web';

  static Future<String> check() async {
    String platform;

    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.fuchsia) {
      platform = android;
    }
    // else if (defaultTargetPlatform == TargetPlatform.fuchsia) {
    //   platform = fuchsia;
    // }
    else if (defaultTargetPlatform == TargetPlatform.iOS) {
      platform = ios;
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      platform = windows;
    } else if (defaultTargetPlatform == TargetPlatform.linux) {
      platform = linux;
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      platform = macOs;
    } else {
      platform = 'web';
    }
    return Future.value(platform);
  }
}
