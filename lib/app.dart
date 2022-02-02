import 'package:flutter/material.dart';
import '../directory/directory.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directorio de Prestadores',
      theme: ThemeData(
        primaryColor: const Color(0xFF9b120b),
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePageMobileLayout(),
    );
  }
}

class MyHomePageMobileLayout extends StatelessWidget {
  const MyHomePageMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppLayout();
  }
}
