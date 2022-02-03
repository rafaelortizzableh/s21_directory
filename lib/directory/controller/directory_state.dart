import '../directory.dart';
import '../../core/core.dart';

class DirectoryState {
  final List<HealthProvider> healthProviders;
  final HealthProvider? selectedProvider;
  final String? error;
  final String? searchQuery;
  final String? specialtyFilterQuery;
  final String? subSpecialtyFilterQuery;

  DirectoryState({
    required this.healthProviders,
    this.selectedProvider,
    this.error,
    this.searchQuery,
    this.specialtyFilterQuery,
    this.subSpecialtyFilterQuery,
  });

  DirectoryState copyWith({
    List<HealthProvider>? healthProviders,
    HealthProvider? selectedProvider,
    String? error,
    String? searchQuery,
    String? specialtyFilterQuery,
    String? subSpecialtyFilterQuery,
  }) {
    return DirectoryState(
      healthProviders: healthProviders ?? this.healthProviders,
      selectedProvider: selectedProvider ?? this.selectedProvider,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
      specialtyFilterQuery: specialtyFilterQuery ?? this.specialtyFilterQuery,
      subSpecialtyFilterQuery:
          subSpecialtyFilterQuery ?? this.subSpecialtyFilterQuery,
    );
  }

  List<String> allSpecialties() {
    var allSpecialties = <String>[];
    for (var provider in healthProviders) {
      if (provider.speciality != null && provider.speciality!.isNotEmpty) {
        final specialty = provider.speciality;
        allSpecialties.add(specialty!);
      }
    }
    final specialtiesSet = <String>{...allSpecialties};
    return specialtiesSet.toList();
  }

  List<String> allSubSpecialties() {
    var allSubSpecialties = <String>[];
    for (var provider in healthProviders) {
      if (provider.subSpeciality != null &&
          provider.subSpeciality!.isNotEmpty) {
        var subSpeciality = provider.subSpeciality;
        allSubSpecialties.add(subSpeciality!);
      }
    }
    final subSpecialtiesSet = <String>{...allSubSpecialties};
    return subSpecialtiesSet.toList();
  }

  List<HealthProvider> searchProviders() {
    var providersToSearch = healthProviders;
    if (specialtyFilterQuery != null) {
      final filteredProviders = providersToSearch
          .where((provider) => provider.speciality == specialtyFilterQuery)
          .toList();
      final newList = <HealthProvider>{...filteredProviders}.toList();
      providersToSearch = newList;
    }
    if (subSpecialtyFilterQuery != null) {
      final filteredProviders = providersToSearch
          .where(
              (provider) => provider.subSpeciality == subSpecialtyFilterQuery)
          .toList();
      final newList = <HealthProvider>{...filteredProviders}.toList();
      providersToSearch = newList;
    }
    if (searchQuery != null && searchQuery != '') {
      final searchByNameProviders = providersToSearch.where((element) {
        return element.name.withoutDiacriticalMarks
            .toLowerCase()
            .contains(searchQuery!.withoutDiacriticalMarks.toLowerCase());
      });
      final searchByProcedureProviders = providersToSearch.where((element) {
        return element.proceduresString != null &&
            element.proceduresString!.withoutDiacriticalMarks
                .toLowerCase()
                .contains(searchQuery!.withoutDiacriticalMarks.toLowerCase());
      });
      final searchBySpecialtyProviders = providersToSearch.where((element) {
        return element.speciality != null &&
            element.speciality!.withoutDiacriticalMarks
                .toLowerCase()
                .contains(searchQuery!.withoutDiacriticalMarks.toLowerCase());
      });
      final searchBySubSpecialtyProviders = providersToSearch.where((element) {
        return element.subSpeciality != null &&
            element.subSpeciality!.withoutDiacriticalMarks
                .toLowerCase()
                .contains(searchQuery!.withoutDiacriticalMarks.toLowerCase());
      });

      final newList = <HealthProvider>{
        ...searchByNameProviders,
        ...searchByProcedureProviders,
        ...searchBySpecialtyProviders,
        ...searchBySubSpecialtyProviders
      };

      providersToSearch = newList.toList();
    }
    return providersToSearch;
  }

  DirectoryState clearSpecialtyFilter() {
    return DirectoryState(
      healthProviders: healthProviders,
      error: error,
      searchQuery: searchQuery,
      selectedProvider: selectedProvider,
      specialtyFilterQuery: null,
      subSpecialtyFilterQuery: subSpecialtyFilterQuery,
    );
  }

  DirectoryState clearSubSpecialtyFilter() {
    return DirectoryState(
      healthProviders: healthProviders,
      error: error,
      searchQuery: searchQuery,
      selectedProvider: selectedProvider,
      specialtyFilterQuery: specialtyFilterQuery,
      subSpecialtyFilterQuery: null,
    );
  }

  DirectoryState clearSearch() {
    return DirectoryState(
      healthProviders: healthProviders,
      error: error,
      searchQuery: null,
      selectedProvider: selectedProvider,
      specialtyFilterQuery: specialtyFilterQuery,
      subSpecialtyFilterQuery: subSpecialtyFilterQuery,
    );
  }

  DirectoryState clearSelectedProvider() {
    return DirectoryState(
      healthProviders: healthProviders,
      error: error,
      searchQuery: searchQuery,
      selectedProvider: null,
      specialtyFilterQuery: specialtyFilterQuery,
      subSpecialtyFilterQuery: subSpecialtyFilterQuery,
    );
  }
}
