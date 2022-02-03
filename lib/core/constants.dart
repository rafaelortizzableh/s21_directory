import 'package:flutter/material.dart';

abstract class AppConstants {
  static const String apiUrl = String.fromEnvironment('API_URL');
  static const String apiToken = String.fromEnvironment('API_TOKEN');
  static const String fallBackImageUrl =
      'https://saludsiglo21.org/wp-content/uploads/2020/04/Directorio-Médico-Logo-S21.png';

  static const Color s21White = Color(0xFFFFFFFF);
  static const Color s21Grey = Color(0xFFF1F1F1);
  static const Color s21Blue = Color(0xFF009CE0);
  static const Color s21Black = Color(0xFF4E423B);
  static const Color s21Red = Color(0xFF9b120b);
}
