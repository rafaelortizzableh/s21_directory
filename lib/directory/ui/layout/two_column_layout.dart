import 'package:flutter/material.dart';

import '../../directory.dart';

class TwoColumnLayout extends StatelessWidget {
  const TwoColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Material(elevation: 2, child: HealthProvidersListWrapper()),
        ),
        Expanded(flex: 2, child: HealthProviderDetails()),
      ],
    );
  }
}
