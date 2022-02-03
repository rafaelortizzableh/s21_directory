import 'package:flutter/material.dart';
import '../../directory.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: AppBar(
              title: const Text('Directorio de Prestadores'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: AppBarSearchAndFilters(
                  maxWidth: boxConstraints.maxWidth,
                ),
              ),
              centerTitle: true),
        ),
        body: boxConstraints.maxWidth < 600
            ? const OneColumnLayout()
            : TwoColumnLayout(maxWidth: boxConstraints.maxWidth),
      );
    });
  }
}
