import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../directory.dart';

class HealthProviderListTile extends StatelessWidget {
  const HealthProviderListTile({
    super.key,
    required this.healthProvider,
    required this.isSelected,
    required this.tileColor,
    required this.onPressed,
  });
  final HealthProvider healthProvider;
  final bool isSelected;
  final Color tileColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final speciality = healthProvider.speciality;
    return ListTile(
      onTap: onPressed,
      tileColor: isSelected
          ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
          : tileColor,
      title: Text(healthProvider.name),
      subtitle: speciality != null && speciality.isNotEmpty
          ? Text(speciality)
          : const SizedBox(),
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
