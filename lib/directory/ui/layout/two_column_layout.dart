import 'package:flutter/material.dart';
import 'package:s21_directory/core/core.dart';

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
        children: [
          const Flexible(child: HealthProvidersListWrapper()),
          Container(color: AppConstants.s21Red, width: 1.0),
          const Expanded(flex: 2, child: HealthProviderDetails())
        ],
      ),
    );
  }
}
