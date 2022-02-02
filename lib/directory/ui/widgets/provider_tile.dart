import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../directory.dart';

class HealthProviderListTile extends StatelessWidget {
  const HealthProviderListTile({
    Key? key,
    required this.healthProvider,
    required this.isSelected,
    required this.tileColor,
    required this.onPressed,
  }) : super(key: key);
  final HealthProvider healthProvider;
  final bool isSelected;
  final Color tileColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      tileColor:
          isSelected ? Colors.redAccent.shade100.withOpacity(0.1) : tileColor,
      title: Text(healthProvider.name),
      leading: SizedBox(
        height: 40.0,
        width: 40.0,
        child: CachedNetworkImage(
          fit: BoxFit.fitWidth,
          imageUrl: healthProvider.imageUrl,
        ),
      ),
    );
  }
}
