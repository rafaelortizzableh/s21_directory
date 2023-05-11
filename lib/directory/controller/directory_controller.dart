import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../directory.dart';

class DirectoryController extends StateNotifier<DirectoryState> {
  DirectoryController({required Ref ref})
      : _ref = ref,
        super(
          const DirectoryState(
            healthProviders: _emptyHealthProvidersList,
            isLoading: true,
          ),
        ) {
    getProviders();
  }

  /// A list of [HealthProvider]s that is empty by default.
  static const _emptyHealthProvidersList = <HealthProvider>[];

  final Ref _ref;

  void selectProvider(HealthProvider provider) {
    state = state.copyWith(selectedProvider: provider);
  }

  void getProviders({
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      state = state.copyWith(isLoading: true);
    }

    final directoryService = _ref.read(directoryServiceProvider);

    try {
      final providersResult =
          await directoryService.getHealthProvidersRemotely();
      if (providersResult.isEmpty) return;
      state = state.removeError();
      state = state.copyWith(
        healthProviders: providersResult,
        isLoading: false,
      );
    } on GetHealthProvidersRemotelyException catch (e) {
      state = state.copyWith(error: e.message, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error:
            'Algo salió mal al cargar el directorio médico.\nInténtalo de nuevo más tarde.',
      );
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
