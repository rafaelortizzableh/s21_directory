import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/core.dart';
import 'directory.dart';

final directoryServiceProvider = Provider.autoDispose<DirectoryService>(
  (ref) => DirectoryService(
    dio: ref.watch(dioProvider),
  ),
);
