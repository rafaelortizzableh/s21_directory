import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../directory.dart';

final directoryProvider =
    StateNotifierProvider.autoDispose<DirectoryController, DirectoryState>(
  (ref) => DirectoryController(ref: ref),
);
