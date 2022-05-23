import 'package:cloudwalk_weather/services/models/common/forecast_clouds.dart';
import 'package:cloudwalk_weather/services/models/common/forecast_main.dart';
import 'package:cloudwalk_weather/services/models/common/forecast_sys.dart';
import 'package:cloudwalk_weather/services/models/common/forecast_weather.dart';
import 'package:cloudwalk_weather/services/models/common/forecast_wind.dart';

class ForecastList {
  late int dt;
  ForecastMain? main;
  List<ForecastWeather>? weather;
  ForecastClouds? clouds;
  ForecastWind? wind;
  int? visibility;
  double? pop;
  ForecastSys? sys;
  String? dtTxt;

  ForecastList(
      {required this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dtTxt});

  ForecastList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? ForecastMain.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <ForecastWeather>[];
      json['weather'].forEach((v) {
        weather!.add(ForecastWeather.fromJson(v));
      });
    }
    clouds =
        json['clouds'] != null ? ForecastClouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? ForecastWind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'].toDouble();
    sys = json['sys'] != null ? ForecastSys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['dt_txt'] = dtTxt;
    return data;
  }
}
