import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s21_directory/core/core.dart';
import 'package:s21_directory/directory/directory.dart';

class HealthProviderDetails extends ConsumerWidget {
  const HealthProviderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthProvider = ref.watch(directoryProvider).selectedProvider;

    if (healthProvider == null) return const FallBackNoProviderSelected();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageAndTitles(healthProvider: healthProvider),
            LocationText(healthProvider: healthProvider),
            ContactText(healthProvider: healthProvider),
            ProceduresText(healthProvider: healthProvider),
          ],
        ),
      ),
    );
  }
}

class ImageAndTitles extends StatelessWidget {
  const ImageAndTitles({Key? key, required this.healthProvider})
      : super(key: key);
  final HealthProvider healthProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional.center,
          child: SizedBox(
            height: 80,
            width: 80,
            child: CachedNetworkImage(
              imageUrl: healthProvider.imageUrl,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        SelectableText(
          healthProvider.name,
          style: theme.textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.bold, color: AppConstants.s21Black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4.0),
        healthProvider.speciality != null &&
                healthProvider.speciality!.isNotEmpty
            ? SelectableText('Especialidad \n${healthProvider.speciality}',
                textAlign: TextAlign.center,
                style: theme.textTheme.subtitle2?.copyWith(
                  color: AppConstants.s21Blue,
                  fontWeight: FontWeight.bold,
                ))
            : const SizedBox(),
        const SizedBox(height: 32.0),
      ],
    );
  }
}

class LocationText extends StatelessWidget {
  const LocationText({Key? key, required this.healthProvider})
      : super(key: key);
  final HealthProvider healthProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final noBuilding =
        healthProvider.building != null || healthProvider.building!.isEmpty;
    final noConsultory =
        healthProvider.consultory != null || healthProvider.consultory!.isEmpty;
    final noModule =
        healthProvider.module != null || healthProvider.module!.isEmpty;
    final noFloor =
        healthProvider.floor != null || healthProvider.floor!.isEmpty;
    final noLocation = noBuilding && noConsultory && noModule && noFloor;
    return noLocation
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText('Ubicación',
                  style: theme.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold)),
              if (!noBuilding)
                SelectableText('Edificio: ${healthProvider.building}'),
              if (!noFloor) SelectableText('${healthProvider.floor}'),
              if (!noModule) SelectableText('${healthProvider.module}'),
              if (!noConsultory) SelectableText('${healthProvider.consultory}'),
              const SizedBox(height: 16.0),
            ],
          );
  }
}

class ContactText extends StatelessWidget {
  const ContactText({Key? key, required this.healthProvider}) : super(key: key);
  final HealthProvider healthProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final noContact =
        healthProvider.telephones == null || healthProvider.telephones!.isEmpty;
    return noContact
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText('Contacto',
                  style: theme.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4.0),
              for (String telephone in healthProvider.telephones!)
                SelectableText(telephone),
              const SizedBox(height: 16.0),
            ],
          );
  }
}

class ProceduresText extends StatelessWidget {
  const ProceduresText({Key? key, required this.healthProvider})
      : super(key: key);
  final HealthProvider healthProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final noProcedures =
        healthProvider.procedures == null || healthProvider.procedures!.isEmpty;
    return noProcedures
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText('Procedimientos',
                  style: theme.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              for (String procedure in healthProvider.procedures!)
                SelectableText(procedure),
            ],
          );
  }
}

class FallBackNoProviderSelected extends StatelessWidget {
  const FallBackNoProviderSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: CachedNetworkImage(
            imageUrl: AppConstants.fallBackImageUrl,
          ),
        ),
        const SizedBox(height: 16.0),
        SelectableText(
          'Directorio Médico\nFundación Salud Siglo 21',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
