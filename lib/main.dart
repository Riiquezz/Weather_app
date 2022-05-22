import 'dart:async';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runZonedGuarded(
    () {
      runApp(WeatherApp());
    },
    (error, stackTrace) {
      print('Caught error: $error');
      print(stackTrace);
    },
  );
}