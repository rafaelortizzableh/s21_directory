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
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HealthProviderHeader(healthProvider: healthProvider),
              HealthProviderBody(healthProvider: healthProvider),
            ],
          ),
        ),
      ),
    );
  }
}

class HealthProviderHeader extends StatelessWidget {
  const HealthProviderHeader({Key? key, required this.healthProvider})
      : super(key: key);
  final HealthProvider healthProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasSpecialty = healthProvider.speciality != null &&
        healthProvider.speciality!.isNotEmpty;

    return SelectableText.rich(
      TextSpan(children: [
        WidgetSpan(
          child: Align(
            alignment: AlignmentDirectional.center,
            child: SizedBox(
              height: 80,
              width: 80,
              child: CachedNetworkImage(
                imageUrl: healthProvider.imageUrl,
              ),
            ),
          ),
        ),
        const WidgetSpan(child: SizedBox(height: 8.0)),
        TextSpan(
          text: '${healthProvider.name}\n',
          style: theme.textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.bold, color: AppConstants.s21Black),
        ),
        if (hasSpecialty) ...[
          TextSpan(
            text: 'Especialidad \n${healthProvider.speciality}',
            style: theme.textTheme.subtitle2?.copyWith(
              color: AppConstants.s21Blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ]),
      textAlign: TextAlign.center,
    );
  }
}

class HealthProviderBody extends StatelessWidget {
  const HealthProviderBody({Key? key, required this.healthProvider})
      : super(key: key);
  final HealthProvider healthProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final noBuilding =
        healthProvider.building == null || healthProvider.building!.isEmpty;
    final noConsultory =
        healthProvider.consultory == null || healthProvider.consultory!.isEmpty;
    final noModule =
        healthProvider.module == null || healthProvider.module!.isEmpty;
    final noFloor =
        healthProvider.floor == null || healthProvider.floor!.isEmpty;
    final noLocation = noBuilding && noConsultory && noModule && noFloor;
    final noContact =
        healthProvider.telephones == null || healthProvider.telephones!.isEmpty;
    final noProcedures =
        healthProvider.procedures == null || healthProvider.procedures!.isEmpty;
    final hasSubSpecialty = healthProvider.subSpeciality != null &&
        healthProvider.subSpeciality!.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText.rich(
          TextSpan(
            children: [
              if (hasSubSpecialty) ...[
                TextSpan(
                  text: 'Subespecialidad\n',
                  style: theme.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '${healthProvider.subSpeciality!.trim()}\n'),
                const WidgetSpan(child: SizedBox(height: 32.0)),
              ],
              if (!noLocation) ...[
                TextSpan(
                  text: 'Ubicación\n',
                  style: theme.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                if (!noBuilding)
                  TextSpan(
                      text: 'Edificio: ${healthProvider.building!.trim()}\n'),
                if (!noFloor)
                  TextSpan(text: '${healthProvider.floor!.trim()}\n'),
                if (!noModule)
                  TextSpan(text: '${healthProvider.module!.trim()}\n'),
                if (!noConsultory)
                  TextSpan(text: '${healthProvider.consultory!.trim()}\n'),
                const WidgetSpan(child: SizedBox(height: 32.0)),
              ],
              if (!noContact) ...[
                TextSpan(
                  text: 'Contacto\n',
                  style: theme.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                for (final telephone in healthProvider.telephones!)
                  TextSpan(text: telephone),
                const TextSpan(text: '\n'),
                const WidgetSpan(child: SizedBox(height: 32.0)),
              ],
              if (!noProcedures) ...[
                TextSpan(
                  text: 'Procedimientos\n',
                  style: theme.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                for (final procedure in healthProvider.procedures!)
                  TextSpan(text: procedure),
              ],
            ],
          ),
        ),
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
