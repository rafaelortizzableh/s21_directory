import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:s21_directory/directory/directory.dart';

import '../../../core/core.dart';

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static const InputBorder border = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(90)),
  );

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var searchQuery = ref.watch(directoryProvider).searchQuery;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: 1,
                controller: _textController,
                textInputAction: TextInputAction.search,
                autocorrect: false,
                onSubmitted: (_) {
                  final platform =
                      ref.read(platformCheckerProvider).checkPlatform();
                  if (platform == TypeOfPlatform.android) {
                    FocusScope.of(context).unfocus();
                  }
                },
                onChanged: (search) => ref
                    .read(directoryProvider.notifier)
                    .searchProviders(search),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: searchQuery == null || searchQuery == ''
                      ? 'Búsqueda'
                      : null,
                  border: SearchBar.border,
                ),
              ),
            ),
            if (searchQuery != null && searchQuery != '')
              IconButton(
                  onPressed: () {
                    _textController.clear();
                    ref.read(directoryProvider.notifier).clearSearch();
                  },
                  icon: const Icon(CupertinoIcons.clear)),
            if (searchQuery != null && searchQuery != '')
              const SizedBox(width: 4.0),
          ],
        ),
      ),
    );
  }
}
