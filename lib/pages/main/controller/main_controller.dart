import 'package:cloudwalk_weather/services/models/forecast_model/forecast_model.dart';
import 'package:cloudwalk_weather/services/models/weather_model/weather_model.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  Future<WeatherModel>? weatherData;
  Future<ForeCastModel>? forecastData;

  String _cityName = '';
  String _searchValue = '';

  String get cityName => _cityName;
  String get searchValue => _searchValue;

  
}
