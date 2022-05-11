import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void initApp() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
