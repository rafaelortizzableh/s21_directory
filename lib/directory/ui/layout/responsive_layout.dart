import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../directory.dart';

final _isMobileLayoutProvider = Provider.autoDispose<bool>((ref) {
  return ref.watch(
    layoutProvider.select(
      (value) => value == Layout.mobile,
    ),
  );
});

class ResponsiveLayout extends ConsumerWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobileLayout = ref.watch(_isMobileLayoutProvider);
    return GestureDetector(
      onTap: () {
        final platform =
            ref.read(platformCheckerProvider).checkPlatform(context.theme);
        if (platform != TypeOfPlatform.other) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: AppBar(
            title: const Text('Directorio de Prestadores'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppBarSearchAndFilters(
                isMobileLayout: isMobileLayout,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body:
            isMobileLayout ? const OneColumnLayout() : const TwoColumnLayout(),
      ),
    );
  }
}
