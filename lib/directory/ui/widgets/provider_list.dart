import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../directory/directory.dart';

class HealthProvidersListWrapper extends ConsumerWidget {
  const HealthProvidersListWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var providerList = ref.watch(directoryProvider).healthProviders;
    if (providerList.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return HealthProvidersList(providers: providerList);
  }
}

class HealthProvidersList extends ConsumerWidget {
  const HealthProvidersList({Key? key, required this.providers})
      : super(key: key);
  final List<HealthProvider> providers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          return HealthProviderListTile(
            healthProvider: providers[index],
            onPressed: () => ref
                .read(directoryProvider.notifier)
                .selectProvider(providers[index]),
            tileColor:
                index.isEven ? AppConstants.s21Grey : AppConstants.s21White,
            isSelected: ref.watch(directoryProvider).selectedProvider ==
                providers[index],
          );
        });
  }
}
