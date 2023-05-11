import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../directory/directory.dart';

class HealthProvidersListWrapper extends ConsumerWidget {
  const HealthProvidersListWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredHealthProvidersList = ref.watch(
      directoryProvider.select((dp) => dp.filteredHealthProviders),
    );

    final error = ref.watch(
      directoryProvider.select((dp) => dp.error),
    );

    final isLoading = ref.watch(directoryProvider.select((dp) => dp.isLoading));

    if (isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    if (error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _refreshHealthProviders(ref),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      );
    }

    return HealthProvidersList(
      providers: filteredHealthProvidersList,
    );
  }

  void _refreshHealthProviders(WidgetRef ref) {
    ref.read(directoryProvider.notifier).getProviders(
          isRefresh: true,
        );
  }
}

class HealthProvidersList extends ConsumerStatefulWidget {
  const HealthProvidersList({
    super.key,
    required this.providers,
  });
  final List<HealthProvider> providers;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HealthProvidersListState();
}

class _HealthProvidersListState extends ConsumerState<HealthProvidersList> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.providers.length,
      itemBuilder: (context, index) {
        final healthProvider = widget.providers[index];
        final isSelected =
            ref.watch(directoryProvider).selectedProvider == healthProvider;

        return HealthProviderListTile(
          healthProvider: healthProvider,
          onPressed: () {
            ref.read(directoryProvider.notifier).selectProvider(
                  healthProvider,
                );
            final platform = ref.read(platformCheckerProvider).checkPlatform();
            if (platform != TypeOfPlatform.other) {
              FocusScope.of(context).unfocus();
            }
          },
          tileColor:
              index.isEven ? AppConstants.s21Grey : AppConstants.s21White,
          isSelected: isSelected,
        );
      },
    );
  }
}
