import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core.dart';

/// Platform Checker Provider
final platformCheckerProvider = Provider.autoDispose<PlatformChecker>((_) {
  return PlatformChecker.instance;
});
