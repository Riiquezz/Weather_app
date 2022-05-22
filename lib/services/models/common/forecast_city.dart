import 'package:cloudwalk_weather/services/models/common/forecast_coordinates.dart';

class ForecastCity {
  int? id;
  String? name;
  ForecastCoord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  ForecastCity(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  ForecastCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord =
        json['coord'] != null ? ForecastCoord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
