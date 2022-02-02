import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../directory.dart';

final directoryProvider =
    StateNotifierProvider<DirectoryController, DirectoryState>(
  (ref) => DirectoryController(
    directoryService: ref.watch(directoryServiceProvider),
  ),
);
