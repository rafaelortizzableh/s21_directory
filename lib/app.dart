import 'package:flutter/material.dart';
import '../core/core.dart';
import '../directory/directory.dart';

class S21Directory extends StatelessWidget {
  const S21Directory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directorio de Prestadores',
      theme: ThemeData(
        fontFamily: 'Open Sans',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.s21Red),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppConstants.s21Red,
          foregroundColor: AppConstants.s21White,
        ),
      ),
      home: const ResponsiveLayout(),
      navigatorKey: AppConstants.navigatorKey,
    );
  }
}
