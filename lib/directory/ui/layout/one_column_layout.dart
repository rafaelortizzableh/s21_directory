import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../directory.dart';

class OneColumnLayout extends ConsumerWidget {
  const OneColumnLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSelectedProvider =
        ref.watch(directoryProvider).selectedProvider != null;
    return Stack(
      children: [
        const HealthProvidersListWrapper(),
        if (hasSelectedProvider) ...[
          const ColoredBox(color: AppConstants.s21White),
          const HealthProviderDetails(),
          Positioned(
            top: 8,
            left: 8,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppConstants.s21Red.withOpacity(0.25),
                ),
                child: IconButton(
                  onPressed: () => _clearSelectedProvider(ref),
                  icon: const Icon(CupertinoIcons.clear),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _clearSelectedProvider(WidgetRef ref) {
    ref.read(directoryProvider.notifier).clearSelectedProvider();
  }
}
