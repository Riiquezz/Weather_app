import 'dart:convert';
import 'dart:io';


import 'package:cloudwalk_weather/services/models/weather_model/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test city request', () {
    final weather = WeatherModel(
      id: 1,
      name: 'Sao Paulo',
    );

    expect(weather.id, 1);
    expect(weather.name, 'Sao Paulo');
  });

  test('Test returning values', () {
    final file =
        File('test/resources/weather_example.json').readAsStringSync();
    final weather =
        WeatherModel.fromJson(jsonDecode(file) as Map<String, dynamic>);

    expect(weather.id, 2332453);
    expect(weather.main!.temp, 308.38);
  });
}