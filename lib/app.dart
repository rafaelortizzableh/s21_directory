import 'package:flutter/material.dart';

import '../core/core.dart';
import '../directory/directory.dart';

class S21Directory extends StatelessWidget {
  const S21Directory({super.key});

  static const _title = 'Directorio de Prestadores Médicos | S21';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: _AppTheme._lightTheme,
      home: const ResponsiveLayout(),
      navigatorKey: AppConstants.navigatorKey,
    );
  }
}

abstract class _AppTheme {
  static ThemeData get _lightTheme {
    return ThemeData(
      fontFamily: 'Open Sans',
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppConstants.s21Red,
      ),
      primarySwatch: AppConstants.primaryMaterialColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppConstants.s21Red,
        foregroundColor: AppConstants.s21White,
      ),
    );
  }
}
