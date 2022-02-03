import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s21_directory/core/core.dart';

import '../../directory.dart';

class AppBarSearchAndFilters extends ConsumerWidget {
  const AppBarSearchAndFilters({
    Key? key,
    required this.maxWidth,
  }) : super(key: key);
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: maxWidth < 600 ? maxWidth * 0.9 : maxWidth * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Column(
          children: [
            const SearchBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: AppDropdownInput<String?>(
                    getLabel: (String? value) => value ?? 'Especialidad',
                    hintText: 'Especialidad',
                    options: ref.watch(directoryProvider).allSpecialties(),
                    value: ref.watch(directoryProvider).specialtyFilterQuery,
                    onChanged: (value) {
                      if (value == null) return;
                      ref.read(directoryProvider.notifier).setSpecialty(value);
                    },
                    onCanceled: () =>
                        ref.read(directoryProvider.notifier).removeSpecialty(),
                  ),
                ),
                Expanded(
                  child: AppDropdownInput<String?>(
                    getLabel: (String? value) => value ?? 'Subespecialidad',
                    hintText: 'Subespecialidad',
                    options: ref.watch(directoryProvider).allSubSpecialties(),
                    value: ref.watch(directoryProvider).subSpecialtyFilterQuery,
                    onChanged: (value) {
                      if (value == null) return;
                      ref
                          .read(directoryProvider.notifier)
                          .setSubSpecialty(value);
                    },
                    onCanceled: () => ref
                        .read(directoryProvider.notifier)
                        .removeSubSpecialty(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends ConsumerWidget {
  const FilterButton({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.hint,
  }) : super(key: key);
  final List<String> items;
  final Function(String) onChanged;
  final String? value;
  final String hint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<String>(
      value: value,
      hint: Text(
        hint,
        style: const TextStyle(color: AppConstants.s21Grey),
      ),
      items:
          items.map((e) => DropdownMenuItem<String>(child: Text(e))).toList(),
      onChanged: (String? value) {
        if (value == null) return;
        if (value == '') return;

        onChanged(value);
      },
    );
  }
}
