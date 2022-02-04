import 'dart:io';

import 'check_platform.dart';

PlatformChecker getManager() => MobilePlatformChecker();

class MobilePlatformChecker extends PlatformChecker {
  @override
  TypeOfPlatform checkPlatform() {
    if (!Platform.isAndroid && !Platform.isAndroid) {
      return TypeOfPlatform.other;
    }
    return Platform.isAndroid ? TypeOfPlatform.android : TypeOfPlatform.ios;
  }
}
