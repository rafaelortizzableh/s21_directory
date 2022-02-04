import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core.dart';

final platformCheckerProvider = Provider<PlatformChecker>((_) {
  return PlatformChecker.instance;
});
