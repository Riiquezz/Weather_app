class ForecastSys {
  String? pod;
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  ForecastSys(
      {this.pod, this.type, this.id, this.country, this.sunrise, this.sunset});

  ForecastSys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pod'] = pod;
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
