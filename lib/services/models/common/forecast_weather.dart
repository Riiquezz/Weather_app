class ForecastWeather {
  int? id;
  String? main;
  String? description;
  String? icon;

  ForecastWeather({this.id, this.main, this.description, this.icon});

  ForecastWeather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}