import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter/services.dart';

void initApp() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
