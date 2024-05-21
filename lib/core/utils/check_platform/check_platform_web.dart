import 'package:flutter/material.dart';

import 'check_platform.dart';

PlatformChecker getManager() => WebPlatformChecker();

class WebPlatformChecker extends PlatformChecker {
  @override
  TypeOfPlatform checkPlatform(ThemeData theme) {
    final platform = theme.platform;
    final isAndroid = platform == TargetPlatform.android;
    final isIOS = platform == TargetPlatform.iOS;

    if (isIOS) {
      return TypeOfPlatform.ios;
    }
    if (isAndroid) {
      return TypeOfPlatform.android;
    }

    return TypeOfPlatform.other;
  }
}
