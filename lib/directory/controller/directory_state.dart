import '../directory.dart';

class DirectoryState {
  final List<HealthProvider> healthProviders;
  final HealthProvider? selectedProvider;
  final String? error;

  DirectoryState({
    required this.healthProviders,
    this.selectedProvider,
    this.error,
  });

  DirectoryState copyWith({
    List<HealthProvider>? healthProviders,
    HealthProvider? selectedProvider,
    String? error,
  }) {
    return DirectoryState(
      healthProviders: healthProviders ?? this.healthProviders,
      selectedProvider: selectedProvider ?? this.selectedProvider,
      error: error ?? this.error,
    );
  }
}
