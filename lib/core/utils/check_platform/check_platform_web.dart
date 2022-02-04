// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/foundation.dart';

import 'check_platform.dart';

PlatformChecker getManager() => WebPlatformChecker();

class WebPlatformChecker extends PlatformChecker {
  @override
  TypeOfPlatform checkPlatform() {
    if (kIsWeb) {
      final userAgent = window.navigator.userAgent.toString().toLowerCase();

      if (userAgent.contains("ipad") || userAgent.contains("iphone")) {
        return TypeOfPlatform.ios;
      } else if (userAgent.contains("android")) {
        return TypeOfPlatform.android;
      } else {
        return TypeOfPlatform.other;
      }
    }
    return TypeOfPlatform.other;
  }
}
