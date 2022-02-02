import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../directory.dart';

class DirectoryController extends StateNotifier<DirectoryState> {
  DirectoryController({required this.directoryService})
      : super(DirectoryState(healthProviders: const <HealthProvider>[])) {
    getProviders();
  }

  final DirectoryService directoryService;

  void selectProvider(HealthProvider provider) {
    state = state.copyWith(selectedProvider: provider);
  }

  void getProviders() async {
    try {
      final providersResult =
          await directoryService.getHealthProvidersRemotely();
      if (providersResult.isEmpty) return;
      state = state.copyWith(
        healthProviders: providersResult,
        selectedProvider: providersResult.first,
      );
    } catch (e) {
      state = state.copyWith(error: '$e');
    }
  }
}
