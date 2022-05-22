import 'package:cloudwalk_weather/services/models/common/forecast_city.dart';
import 'package:cloudwalk_weather/services/models/forecast_model/forecast_list_model.dart';

class ForeCastModel {
  String? cod;
  int? message;
  int? cnt;
  List<ForecastList>? list;
  ForecastCity? city;

  ForeCastModel({this.cod, this.message, this.cnt, this.list, this.city});

  ForeCastModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <ForecastList>[];
      json['list'].forEach((v) {
        list!.add(ForecastList.fromJson(v));
      });
    }
    city = json['city'] != null ? ForecastCity.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

