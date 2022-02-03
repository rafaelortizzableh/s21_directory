import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s21_directory/core/core.dart';

import '../../directory.dart';

class OneColumnLayout extends ConsumerWidget {
  const OneColumnLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        const HealthProvidersListWrapper(),
        if (ref.watch(directoryProvider).selectedProvider != null)
          Container(color: AppConstants.s21White),
        if (ref.watch(directoryProvider).selectedProvider != null)
          const HealthProviderDetails(),
        if (ref.watch(directoryProvider).selectedProvider != null)
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
                      onPressed: () => ref
                          .read(directoryProvider.notifier)
                          .clearSelectedProvider(),
                      icon: const Icon(CupertinoIcons.clear)),
                ),
              ))
      ],
    );
  }
}
