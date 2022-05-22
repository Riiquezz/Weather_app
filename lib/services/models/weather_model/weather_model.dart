import 'package:cloudwalk_weather/services/models/common/forecast_clouds.dart';
import 'package:cloudwalk_weather/services/models/common/forecast_coordinates.dart';
import 'package:cloudwalk_weather/services/models/common/forecast_main.dart';
import 'package:cloudwalk_weather/services/models/common/forecast_sys.dart';
import 'package:cloudwalk_weather/services/models/common/forecast_weather.dart';
import 'package:cloudwalk_weather/services/models/common/forecast_wind.dart';

class WeatherModel {
  ForecastCoord? coord;
  List<ForecastWeather>? weather;
  String? base;
  ForecastMain? main;
  int? visibility;
  ForecastWind? wind;
  ForecastClouds? clouds;
  int? dt;
  ForecastSys? sys;
  int? timezone;
  late int id;
  String? name;
  int? cod;

  WeatherModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      required this.id,
      this.name,
      this.cod});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? ForecastCoord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <ForecastWeather>[];
      json['weather'].forEach((v) {
        weather!.add(ForecastWeather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? ForecastMain.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? ForecastWind.fromJson(json['wind']) : null;
    clouds =
        json['clouds'] != null ? ForecastClouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? ForecastSys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}