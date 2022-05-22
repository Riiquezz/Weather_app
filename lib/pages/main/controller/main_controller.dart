import 'dart:io';

import 'package:cloudwalk_weather/services/models/forecast_model/forecast_model.dart';
import 'package:cloudwalk_weather/services/models/weather_model/weather_model.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  Future<WeatherModel>? weatherData;
  Future<ForeCastModel>? forecastData;

  final RxString _cityName = ''.obs;
  final RxString _searchValue = ''.obs;

  final RxBool _hasInternetConnection = true.obs;

  String get cityName => _cityName.value;
  String get searchValue => _searchValue.value;
  bool get hasInternetConnection => _hasInternetConnection.value;

  set cityName(String value) => _cityName.value = value;
  set searchValue(String value) => _searchValue.value = value;
  set hasInternetConnection(bool value) => _hasInternetConnection.value = value;


  Future<bool> isConnectedToInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasInternetConnection = true;
      }
    } on SocketException catch (_) {
      hasInternetConnection = false;
    }
    return hasInternetConnection;
  }
}
