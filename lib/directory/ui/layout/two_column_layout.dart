import 'package:flutter/material.dart';

import '../../directory.dart';

class TwoColumnLayout extends StatelessWidget {
  const TwoColumnLayout({Key? key, required this.maxWidth}) : super(key: key);
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Flexible(
            child: Material(elevation: 3, child: HealthProvidersListWrapper()),
          ),
          Expanded(flex: 2, child: HealthProviderDetails()),
        ],
      ),
    );
  }
}
