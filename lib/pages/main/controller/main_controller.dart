import 'dart:io';

import 'package:cloudwalk_weather/services/datasource/weather_service.dart';
import 'package:cloudwalk_weather/services/models/forecast_model/forecast_model.dart';
import 'package:cloudwalk_weather/services/models/weather_model/weather_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  void onInit() async {
    super.onInit();
    await isConnectedToInternet();
    await getWeatherData();
    await getForecastData();
  }

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

  Future<void> webview(String url) async {
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getWeatherData() async {
    WeatherService weatherService = WeatherService();
    weatherData = weatherService.getWeatherData(cityName: 'São Paulo');
  }

  Future<void> getForecastData() async {
    WeatherService weatherService = WeatherService();
    forecastData = weatherService.getWeatherForecastData(cityName: 'São Paulo');
  }
}
