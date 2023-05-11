import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../directory.dart';
import '../../../core/core.dart';

class ResponsiveLayout extends ConsumerWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                final platform =
                    ref.read(platformCheckerProvider).checkPlatform();
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
                          maxWidth: boxConstraints.maxWidth,
                        ),
                      ),
                      centerTitle: true),
                ),
                body: boxConstraints.maxWidth < 600
                    ? const OneColumnLayout()
                    : TwoColumnLayout(maxWidth: boxConstraints.maxWidth),
              ),
            );
          },
        );
      },
    );
  }
}
