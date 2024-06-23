import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:company/src/app_root.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(AppRoot()));
  //runApp(const AppRoot());
}

