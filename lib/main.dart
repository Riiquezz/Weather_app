import 'dart:async';

import 'package:cloudwalk_weather/application.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () {
      runApp(const WeatherApp());
    },
    (error, stackTrace) {
      throw error;
    },
  );
}
