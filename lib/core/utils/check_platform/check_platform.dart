import 'check_platform_stub.dart'
    if (dart.library.io) 'check_platform_mobile.dart'
    if (dart.library.js) 'check_platform_web.dart';

enum TypeOfPlatform { ios, android, other }

abstract class PlatformChecker {
  static PlatformChecker? _instance;

  static PlatformChecker get instance {
    return _instance ??= getManager();
  }

  TypeOfPlatform checkPlatform();
}
