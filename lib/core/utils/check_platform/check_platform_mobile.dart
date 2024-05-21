import 'package:flutter/material.dart';

import 'check_platform.dart';

PlatformChecker getManager() => MobilePlatformChecker();

class MobilePlatformChecker extends PlatformChecker {
  @override
  TypeOfPlatform checkPlatform(ThemeData theme) {
    final platform = theme.platform;
    if (platform != TargetPlatform.android && platform != TargetPlatform.iOS) {
      return TypeOfPlatform.other;
    }
    return platform == TargetPlatform.android
        ? TypeOfPlatform.android
        : TypeOfPlatform.ios;
  }
}
