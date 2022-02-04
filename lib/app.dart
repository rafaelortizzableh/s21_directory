import 'package:flutter/material.dart';
import '../core/core.dart';
import '../directory/directory.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directorio de Prestadores',
      theme: ThemeData(
        fontFamily: 'Open Sans',
        primaryColor: AppConstants.s21Red,
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppConstants.s21Red,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout();
  }
}

// int solution(int n) {
//   if (n < 1) return 0;

//   var multiplesList = <int>[];
//   for (int i = 1; i < n; i++) {
//     int? multiple;

//     if (i % 5 == 0) {
//       multiple = i;
//     }
//     if (i % 3 == 0) {
//       multiple = i;
//     }
//     if (multiple != null) {
//       multiplesList.add(multiple);
//     }
//   }
//   // Here we remove all of the duplicates, so if a number is a multiple of both, we only use it once
//   multiplesList = multiplesList.toSet().toList();

//   return multiplesList.reduce((value, element) => value + element);
// }

int solution(String digits) {
  final digitsList = digits.split('');
  int currentMax = 0;
  for (var i = 0; i < digitsList.length + 1; i++) {
    if (digitsList.length - 5 > i) {
      final String currentDigit = digitsList[i];
      final String digitTwoInList = digitsList[i + 1];
      final String digitThreeInList = digitsList[i + 2];
      final String digitFourInList = digitsList[i + 3];
      final String digitFiveInList = digitsList[i + 4];

      final fiveDigitsList = [
        currentDigit,
        digitTwoInList,
        digitThreeInList,
        digitFourInList,
        digitFiveInList
      ];
      final String fiveNumbers =
          fiveDigitsList.reduce((value, element) => value + element);

      final int number = int.parse(fiveNumbers);

      currentMax = number > currentMax ? number : currentMax;
    }
  }
  return currentMax;
}
