import 'dart:convert';

import 'package:cloudwalk_weather/services/endpoints.dart';
import 'package:cloudwalk_weather/services/models/forecast_model/forecast_model.dart';
import 'package:cloudwalk_weather/services/models/weather_model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  //Get weather data for present day and return using WeatherModel class
  Future<WeatherModel> getWeatherData({required String cityName}) async {
    var finalUrl = 'https://api.openweathermap.org/data/2.5/weather?q=' +
        cityName +
        '&appid=' +
        Endpoints.openWeatherAPIKey;

    final response = await http.get(Uri.parse(finalUrl));

    print(response);

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }

  //Get weather forecast for next 5 days
  Future<ForeCastModel> getWeatherForecastData(
      {required String cityName}) async {
    var finalUrl = 'https://api.openweathermap.org/data/2.5/forecast?q=' +
        cityName +
        '&appid=' +
        Endpoints.openWeatherAPIKey;

    final response = await http.get(Uri.parse(finalUrl));

    print(response);

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return ForeCastModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error getting weather forecast");
    }
  }
}
