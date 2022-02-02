import 'package:flutter/material.dart';
import '../../directory.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return Scaffold(
        appBar: AppBar(
            title: const Text('Directorio de proveedores'), centerTitle: true),
        body: boxConstraints.maxWidth < 600
            ? const HomeMobileLayout()
            : HomeDesktopLayout(maxWidth: boxConstraints.maxWidth),
      );
    });
  }
}
