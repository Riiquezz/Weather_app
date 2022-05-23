class ForecastMain {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  ForecastMain(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.seaLevel,
      this.grndLevel,
      this.humidity,
      this.tempKf
      });

  ForecastMain.fromJson(Map<String, dynamic> json) {
    temp = json['temp'].toDouble() ?? 0.0;
    feelsLike = json['feels_like'].toDouble() ?? 0.0;
    tempMin = json['temp_min'].toDouble() ?? 0.0;
    tempMax = json['temp_max'].toDouble() ?? 0.0;
    pressure = json['pressure'] ?? 0;
    seaLevel = json['sea_level'] ?? 0;
    grndLevel = json['grnd_level'] ?? 0;
    humidity = json['humidity'] ?? 0;
    tempKf != null ? tempKf = json['temp_kf'].toDouble() : 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempKf;
    return data;
  }
}
