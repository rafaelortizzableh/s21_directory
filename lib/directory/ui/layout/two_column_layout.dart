import 'package:flutter/material.dart';

import '../../directory.dart';

class TwoColumnLayout extends StatelessWidget {
  const TwoColumnLayout({Key? key, required this.maxWidth}) : super(key: key);
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Material(elevation: 2, child: HealthProvidersListWrapper()),
          ),
          Expanded(flex: 2, child: HealthProviderDetails()),
        ],
      ),
    );
  }
}
