import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core.dart';

/// Platform Checker Provider
final platformCheckerProvider = Provider<PlatformChecker>((_) {
  return PlatformChecker.instance;
});
