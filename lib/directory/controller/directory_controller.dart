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
      state = state.copyWith(healthProviders: providersResult);
    } catch (e) {
      state = state.copyWith(error: '$e');
    }
  }

  void searchProviders(String searchQuery) {
    state = state.copyWith(searchQuery: searchQuery);
  }

  void setSpecialty(String specialty) {
    state = state.copyWith(specialtyFilterQuery: specialty);
  }

  void setSubSpecialty(String subSpecialty) {
    state = state.copyWith(subSpecialtyFilterQuery: subSpecialty);
  }

  void removeSpecialty() {
    state = state.clearSpecialtyFilter();
  }

  void removeSubSpecialty() {
    state = state.clearSubSpecialtyFilter();
  }

  void clearSearch() {
    state = state.clearSearch();
  }

  void clearSelectedProvider() {
    state = state.clearSelectedProvider();
  }
}
