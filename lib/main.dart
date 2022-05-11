import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/core.dart';
import 'app.dart';

void main() {
  initApp();
  runApp(const ProviderScope(child: MyApp()));
}
