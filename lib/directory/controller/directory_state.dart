import 'package:collection/collection.dart';

import '../directory.dart';
import '../../core/core.dart';

class DirectoryState {
  const DirectoryState({
    required this.healthProviders,
    required this.isLoading,
    this.selectedProvider,
    this.error,
    this.searchQuery,
    this.specialtyFilterQuery,
    this.subSpecialtyFilterQuery,
  });
  final List<HealthProvider> healthProviders;
  final HealthProvider? selectedProvider;
  final String? error;
  final String? searchQuery;
  final String? specialtyFilterQuery;
  final String? subSpecialtyFilterQuery;
  final bool isLoading;

  DirectoryState copyWith({
    List<HealthProvider>? healthProviders,
    HealthProvider? selectedProvider,
    String? error,
    String? searchQuery,
    String? specialtyFilterQuery,
    String? subSpecialtyFilterQuery,
    bool isLoading = false,
  }) {
    return DirectoryState(
      healthProviders: healthProviders ?? this.healthProviders,
      selectedProvider: selectedProvider ?? this.selectedProvider,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
      specialtyFilterQuery: specialtyFilterQuery ?? this.specialtyFilterQuery,
      subSpecialtyFilterQuery:
          subSpecialtyFilterQuery ?? this.subSpecialtyFilterQuery,
      isLoading: isLoading,
    );
  }

  List<String> allSpecialties() {
    final allSpecialties = healthProviders.map((e) {
      if (e.speciality != null && e.speciality!.isNotEmpty) {
        return e.speciality!;
      }
      return null;
    }).toList();

    final specialtiesSet = <String>{...allSpecialties.whereNotNull()};
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

  List<HealthProvider> get filteredHealthProviders {
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
      isLoading: isLoading,
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
      isLoading: isLoading,
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
      isLoading: isLoading,
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
      isLoading: isLoading,
    );
  }

  DirectoryState removeError() {
    return DirectoryState(
      healthProviders: healthProviders,
      selectedProvider: selectedProvider,
      error: null,
      searchQuery: searchQuery,
      specialtyFilterQuery: specialtyFilterQuery,
      subSpecialtyFilterQuery: subSpecialtyFilterQuery,
      isLoading: isLoading,
    );
  }
}
