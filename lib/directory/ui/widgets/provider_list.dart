import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../directory/directory.dart';

class HealthProvidersListWrapper extends ConsumerWidget {
  const HealthProvidersListWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerList = ref.watch(directoryProvider).healthProviders;
    var filteredList = ref.watch(directoryProvider).searchProviders();
    if (providerList.isEmpty) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    return HealthProvidersList(providers: filteredList);
  }
}

class HealthProvidersList extends ConsumerStatefulWidget {
  const HealthProvidersList({Key? key, required this.providers})
      : super(key: key);
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
          return HealthProviderListTile(
            healthProvider: widget.providers[index],
            onPressed: () {
              ref
                  .read(directoryProvider.notifier)
                  .selectProvider(widget.providers[index]);
              final platform =
                  ref.read(platformCheckerProvider).checkPlatform();
              if (platform != TypeOfPlatform.other) {
                FocusScope.of(context).unfocus();
              }
            },
            tileColor:
                index.isEven ? AppConstants.s21Grey : AppConstants.s21White,
            isSelected: ref.watch(directoryProvider).selectedProvider ==
                widget.providers[index],
          );
        });
  }
}
