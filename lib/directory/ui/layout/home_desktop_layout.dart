import 'package:flutter/material.dart';

import '../../directory.dart';

class HomeDesktopLayout extends StatelessWidget {
  const HomeDesktopLayout({Key? key, required this.maxWidth}) : super(key: key);
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const HealthProvidersListWrapper(),
        Container(color: Colors.red)
      ],
    );
  }
}
